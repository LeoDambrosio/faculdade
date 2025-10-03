"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
const readline = __importStar(require("readline-sync"));
// Classe para Gerenciamento de Tarefas
class TaskManager {
    tasks = [];
    nextId = 1;
    // Adiciona uma nova tarefa
    addTask(title) {
        const newTask = {
            id: this.nextId++,
            title,
            completed: false
        };
        this.tasks.push(newTask);
        console.log(`Tarefa adicionada: ${title}`);
    }
    // Lista todas as tarefas
    listTasks() {
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
    completeTask(id) {
        const task = this.tasks.find(task => task.id === id);
        if (task) {
            task.completed = true;
            console.log(`✅ Tarefa concluída: ${task.title}`);
        }
        else {
            console.log("⚠️ Tarefa não encontrada.");
        }
    }
    // Remove uma tarefa
    removeTask(id) {
        const index = this.tasks.findIndex(task => task.id === id);
        if (index !== -1) {
            const removedTask = this.tasks.splice(index, 1);
            console.log(`🗑️ Tarefa removida: ${removedTask[0].title}`);
        }
        else {
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
main();
//# sourceMappingURL=index.js.map