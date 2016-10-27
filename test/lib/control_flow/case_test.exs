defmodule Control.CaseTest do
  use ExUnit.Case, async: true

  test "case without guard" do
    bond = %{name: "Bond", number: 7}

    assert {:ok, ^bond} = Control.Case.verify_agent(bond)
    assert {:error, _} = Control.Case.verify_agent(%{name: "Not bond"})
  end

  test "case with guard" do
    bond      = %{name: "Bond", number: 7}
    fake_bond = %{name: "Bond", number: 2}
    powers    = %{name: "Powers"}

    assert {:ok, ^bond}   = Control.Case.fancy_verify_agent(bond)
    assert {:ok, ^powers} = Control.Case.fancy_verify_agent(powers)
    assert {:error, _}    = Control.Case.fancy_verify_agent(fake_bond)
  end
end
