CREATE TABLE repositories (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    url VARCHAR(2048) NOT NULL,

    name VARCHAR(255) NOT NULL,

    status VARCHAR(50) NOT NULL DEFAULT 'QUEUED',

    progress INTEGER NOT NULL DEFAULT 0,

    file_count INTEGER NOT NULL DEFAULT 0,

    error_message TEXT,

    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_repository_progress
        CHECK (progress BETWEEN 0 AND 100),

    CONSTRAINT chk_repository_file_count
        CHECK (file_count >= 0)
);