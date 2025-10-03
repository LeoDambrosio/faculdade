import * as readline from "readline-sync";

// Definição da Interface para uma Tarefa
interface Task {
  id: number;
  title: string;
  completed: boolean;
}

// Classe para Gerenciamento de Tarefas
class TaskManager {
  private tasks: Task[] = [];
  private nextId: number = 1;

  // Adiciona uma nova tarefa
  addTask(title: string): void {
    const newTask: Task = {
      id: this.nextId++,
      title,
      completed: false
    };
    this.tasks.push(newTask);
    console.log(`Tarefa adicionada: ${title}`);
  }

  // Lista todas as tarefas
  listTasks(): void {
    console.log("\n=== Lista de Tarefas ===");
    if (this.tasks.length === 0) {
      console.log("Nenhuma tarefa cadastrada.");
      return;
    }
    this.tasks.forEach(task => {
      console.log(`${task.id}. [${task.completed ? "✅" : "❌"}] ${task.title}`);
    });
  }

  // Marca uma tarefa como concluída
  completeTask(id: number): void {
    const task = this.tasks.find(task => task.id === id);
    if (task) {
      task.completed = true;
      console.log(`✅ Tarefa concluída: ${task.title}`);
    } else {
      console.log("⚠️ Tarefa não encontrada.");
    }
  }

  // Remove uma tarefa
  removeTask(id: number): void {
    const index = this.tasks.findIndex(task => task.id === id);
    if (index !== -1) {
      const removedTask = this.tasks.splice(index, 1);
      console.log(`🗑️ Tarefa removida: ${removedTask[0].title}`);
    } else {
      console.log("⚠️ Tarefa não encontrada.");
    }
  }
}

// Função principal para interagir com o usuário
function main() {
  const taskManager = new TaskManager();

  while (true) {
    console.log("\n=== Gerenciador de Tarefas ===");
    console.log("1. Adicionar Tarefa");
    console.log("2. Listar Tarefas");
    console.log("3. Concluir Tarefa");
    console.log("4. Remover Tarefa");
    console.log("5. Sair");

    const choice = readline.questionInt("Escolha uma opção: ");

    switch (choice) {
      case 1:
        const title = readline.question("Digite o título da tarefa: ");
        taskManager.addTask(title);
        break;
      case 2:
        taskManager.listTasks();
        break;
      case 3:
        const completeId = readline.questionInt("Digite o ID da tarefa para concluir: ");
        taskManager.completeTask(completeId);
        break;
      case 4:
        const removeId = readline.questionInt("Digite o ID da tarefa para remover: ");
        taskManager.removeTask(removeId);
        break;
      case 5:
        console.log("👋 Saindo do gerenciador de tarefas...");
        return;
      default:
        console.log("⚠️ Opção inválida. Tente novamente.");
    }
  }
}

// Inicia o programa
main();
