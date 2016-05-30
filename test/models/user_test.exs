defmodule Peepchat.UserTest do
  use Peepchat.ModelCase

  alias Peepchat.User

  @valid_attrs %{email: "mike@example.com",
    password: "abcdef123",
    password_confirmation: "abcdef123"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "lksjadf342fasd",
      password_confirmation: "asvilkas23jfsa09"})
    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "lksjadf342fasd"})
    refute changeset.valid?
  end

  test "short password length doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "abc123",
      password_confirmation: "abc123"})
    refute changeset.valid?
  end
end
