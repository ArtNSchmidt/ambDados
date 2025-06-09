-- CreateTable
CREATE TABLE `Departamento` (
    `id_departamento` INTEGER NOT NULL,
    `nome_departamento` VARCHAR(191) NOT NULL,
    `descricao` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_departamento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PlanoSaude` (
    `id_plano` INTEGER NOT NULL,
    `nome_plano` VARCHAR(191) NOT NULL,
    `codigo_operadora` VARCHAR(191) NOT NULL,
    `tipo_cobertura` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_plano`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Paciente` (
    `id_paciente` INTEGER NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,
    `data_nascimento` DATETIME(3) NOT NULL,
    `sexo` VARCHAR(191) NOT NULL,
    `endereco` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_paciente`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sala` (
    `id_sala` INTEGER NOT NULL,
    `numero_sala` INTEGER NOT NULL,
    `tipo_sala` VARCHAR(191) NOT NULL,
    `andar` INTEGER NOT NULL,

    PRIMARY KEY (`id_sala`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Medico` (
    `id_medico` INTEGER NOT NULL,
    `nome_med` VARCHAR(191) NOT NULL,
    `crm` VARCHAR(191) NOT NULL,
    `especialidade` VARCHAR(191) NOT NULL,
    `telefone` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `departamento_id` INTEGER NOT NULL,

    PRIMARY KEY (`id_medico`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Enfermeiro` (
    `id_enfermeiro` INTEGER NOT NULL,
    `nome_enfermeiro` VARCHAR(191) NOT NULL,
    `registro_coren` VARCHAR(191) NOT NULL,
    `turno` VARCHAR(191) NOT NULL,
    `telefone` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_enfermeiro`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Atendimento` (
    `id_atendimento` INTEGER NOT NULL,
    `tipo_consulta` VARCHAR(191) NOT NULL,
    `data_hora` DATETIME(3) NOT NULL,
    `paciente_id` INTEGER NOT NULL,
    `medico_id` INTEGER NOT NULL,
    `sala_id` INTEGER NOT NULL,
    `enfermeiro_id` INTEGER NOT NULL,
    `plano_id` INTEGER NOT NULL,

    PRIMARY KEY (`id_atendimento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Exame` (
    `id_exame` INTEGER NOT NULL,
    `nome_exame` VARCHAR(191) NOT NULL,
    `descricao` VARCHAR(191) NOT NULL,
    `data_exame` DATETIME(3) NOT NULL,
    `resultado` VARCHAR(191) NOT NULL,
    `paciente_id` INTEGER NOT NULL,
    `medico_id` INTEGER NOT NULL,
    `departamento_id` INTEGER NOT NULL,
    `sala_id` INTEGER NOT NULL,
    `plano_id` INTEGER NOT NULL,

    PRIMARY KEY (`id_exame`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Medicamento` (
    `id_medicamento` INTEGER NOT NULL,
    `nome_comercial` VARCHAR(191) NOT NULL,
    `principio_ativo` VARCHAR(191) NOT NULL,
    `formatacao` VARCHAR(191) NOT NULL,
    `dosagem_padrao` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_medicamento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Prescricao` (
    `id_prescricao` INTEGER NOT NULL,
    `data_emissao` DATETIME(3) NOT NULL,
    `validade` VARCHAR(191) NOT NULL,
    `instrucao` VARCHAR(191) NOT NULL,
    `paciente_id` INTEGER NOT NULL,
    `medico_id` INTEGER NOT NULL,

    PRIMARY KEY (`id_prescricao`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PrescricaoMedicamento` (
    `id_prescricao_med` INTEGER NOT NULL,
    `id_medicamento` INTEGER NOT NULL,
    `id_prescricao` INTEGER NOT NULL,

    PRIMARY KEY (`id_prescricao_med`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Medico` ADD CONSTRAINT `Medico_departamento_id_fkey` FOREIGN KEY (`departamento_id`) REFERENCES `Departamento`(`id_departamento`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Atendimento` ADD CONSTRAINT `Atendimento_paciente_id_fkey` FOREIGN KEY (`paciente_id`) REFERENCES `Paciente`(`id_paciente`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Atendimento` ADD CONSTRAINT `Atendimento_medico_id_fkey` FOREIGN KEY (`medico_id`) REFERENCES `Medico`(`id_medico`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Atendimento` ADD CONSTRAINT `Atendimento_sala_id_fkey` FOREIGN KEY (`sala_id`) REFERENCES `Sala`(`id_sala`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Atendimento` ADD CONSTRAINT `Atendimento_enfermeiro_id_fkey` FOREIGN KEY (`enfermeiro_id`) REFERENCES `Enfermeiro`(`id_enfermeiro`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Atendimento` ADD CONSTRAINT `Atendimento_plano_id_fkey` FOREIGN KEY (`plano_id`) REFERENCES `PlanoSaude`(`id_plano`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Exame` ADD CONSTRAINT `Exame_paciente_id_fkey` FOREIGN KEY (`paciente_id`) REFERENCES `Paciente`(`id_paciente`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Exame` ADD CONSTRAINT `Exame_medico_id_fkey` FOREIGN KEY (`medico_id`) REFERENCES `Medico`(`id_medico`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Exame` ADD CONSTRAINT `Exame_departamento_id_fkey` FOREIGN KEY (`departamento_id`) REFERENCES `Departamento`(`id_departamento`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Exame` ADD CONSTRAINT `Exame_sala_id_fkey` FOREIGN KEY (`sala_id`) REFERENCES `Sala`(`id_sala`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Exame` ADD CONSTRAINT `Exame_plano_id_fkey` FOREIGN KEY (`plano_id`) REFERENCES `PlanoSaude`(`id_plano`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Prescricao` ADD CONSTRAINT `Prescricao_paciente_id_fkey` FOREIGN KEY (`paciente_id`) REFERENCES `Paciente`(`id_paciente`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Prescricao` ADD CONSTRAINT `Prescricao_medico_id_fkey` FOREIGN KEY (`medico_id`) REFERENCES `Medico`(`id_medico`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PrescricaoMedicamento` ADD CONSTRAINT `PrescricaoMedicamento_id_medicamento_fkey` FOREIGN KEY (`id_medicamento`) REFERENCES `Medicamento`(`id_medicamento`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PrescricaoMedicamento` ADD CONSTRAINT `PrescricaoMedicamento_id_prescricao_fkey` FOREIGN KEY (`id_prescricao`) REFERENCES `Prescricao`(`id_prescricao`) ON DELETE RESTRICT ON UPDATE CASCADE;
