defmodule Todo.TodosTest do
  use Todo.DataCase

  alias Todo.Todos

  describe "tasks" do
    alias Todo.Todos.Task

    import Todo.TodosFixtures

    @invalid_attrs %{priority: nil, title: nil, completed: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Todos.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Todos.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{priority: "some priority", title: "some title", completed: true}

      assert {:ok, %Task{} = task} = Todos.create_task(valid_attrs)
      assert task.priority == "some priority"
      assert task.title == "some title"
      assert task.completed == true
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{priority: "some updated priority", title: "some updated title", completed: false}

      assert {:ok, %Task{} = task} = Todos.update_task(task, update_attrs)
      assert task.priority == "some updated priority"
      assert task.title == "some updated title"
      assert task.completed == false
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_task(task, @invalid_attrs)
      assert task == Todos.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Todos.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Todos.change_task(task)
    end
  end
end
