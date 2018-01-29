//
// Base test class for sap1 testbench.
//
`ifndef INCLUDED_sap1_base_test
`define INCLUDED_sap1_base_test

class sap1_base_test extends uvm_test;
  `uvm_component_utils(sap1_base_test)

  sap1_env_config env_cfg;
  sap1_env env;
  Sap1 regmodel;
  host_bus_handle host_handle;

  virtual clkgen_if clkgen_if;

  function new(string name="sap1_base_test", uvm_component parent=null);
    super.new(name, parent);
    regmodel = new(.name("sap1"), .parent(null));
  endfunction

  virtual task wait_for_reset();
    repeat(10) @(clkgen_if.clk);
  endtask

  function void build_phase(uvm_phase phase);
    `uvm_info(get_full_name(), "Building test uvm_base_test", UVM_NONE)

    if(!uvm_config_db#(virtual clkgen_if)::get(null, "uvm_test_top", "clkgen_if",
      clkgen_if)) begin
      `uvm_fatal(get_full_name(), "Cannot get() interface clkgen_if from uvm_config_db")
    end

    env_cfg = sap1_env_config::type_id::create("sap1_env_config", this);
    uvm_config_db #(sap1_env_config)::set(this, "*", "sap1_env_config", env_cfg);

    env = sap1_env::type_id::create("sap1_env", this);
    host_handle = host_bus_handle::type_id::create("host_bus_handle");

  endfunction
  
  function void connect_phase(uvm_phase phase);
    regmodel.add_adapter(env.host_agent_inst.adapter);
  endfunction

  function int get_num_errors();
    uvm_report_server server = get_report_server();
    return server.get_severity_count(UVM_ERROR);
  endfunction

  function void report_phase(uvm_phase phase);
    $display("\n");
    $display("====================================================");
    if(get_num_errors() == 0) begin
      $display("\tTEST PASSED.");
    end else begin
      $display("\tTEST FAILED. ErrCnt=%0d", get_num_errors());
    end
    $display("====================================================");
    $display("\n");
  endfunction


endclass
`endif
