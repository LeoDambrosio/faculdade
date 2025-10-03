"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var readline = require("readline-sync");
// Classe para Gerenciamento de Tarefas
var TaskManager = /** @class */ (function () {
    function TaskManager() {
        this.tasks = [];
        this.nextId = 1;
    }
    // Adiciona uma nova tarefa
    TaskManager.prototype.addTask = function (title) {
        var newTask = {
            id: this.nextId++,
            title: title,
            completed: false
        };
        this.tasks.push(newTask);
        console.log("Tarefa adicionada: ".concat(title));
    };
    // Lista todas as tarefas
    TaskManager.prototype.listTasks = function () {
        console.log("\n=== Lista de Tarefas ===");
        if (this.tasks.length === 0) {
            console.log("Nenhuma tarefa cadastrada.");
            return;
        }
        this.tasks.forEach(function (task) {
            console.log("".concat(task.id, ". [").concat(task.completed ? "✅" : "❌", "] ").concat(task.title));
        });
    };
    // Marca uma tarefa como concluída
    TaskManager.prototype.completeTask = function (id) {
        var task = this.tasks.find(function (task) { return task.id === id; });
        if (task) {
            task.completed = true;
            console.log("\u2705 Tarefa conclu\u00EDda: ".concat(task.title));
        }
        else {
            console.log("⚠️ Tarefa não encontrada.");
        }
    };
    // Remove uma tarefa
    TaskManager.prototype.removeTask = function (id) {
        var index = this.tasks.findIndex(function (task) { return task.id === id; });
        if (index !== -1) {
            var removedTask = this.tasks.splice(index, 1);
            console.log("\uD83D\uDDD1\uFE0F Tarefa removida: ".concat(removedTask[0].title));
        }
        else {
            console.log("⚠️ Tarefa não encontrada.");
        }
    };
    return TaskManager;
}());
// Função principal para interagir com o usuário
function main() {
    var taskManager = new TaskManager();
    while (true) {
        console.log("\n=== Gerenciador de Tarefas ===");
        console.log("1. Adicionar Tarefa");
        console.log("2. Listar Tarefas");
        console.log("3. Concluir Tarefa");
        console.log("4. Remover Tarefa");
        console.log("5. Sair");
        var choice = readline.questionInt("Escolha uma opção: ");
        switch (choice) {
            case 1:
                var title = readline.question("Digite o título da tarefa: ");
                taskManager.addTask(title);
                break;
            case 2:
                taskManager.listTasks();
                break;
            case 3:
                var completeId = readline.questionInt("Digite o ID da tarefa para concluir: ");
                taskManager.completeTask(completeId);
                break;
            case 4:
                var removeId = readline.questionInt("Digite o ID da tarefa para remover: ");
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
