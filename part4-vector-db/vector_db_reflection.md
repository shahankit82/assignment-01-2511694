## Vector DB Use Case

A traditional keyword-based database search would likely not be sufficient for a system that allows lawyers to search large contracts using natural language questions. Keyword searches work by matching exact words or phrases within a document. However, legal documents often contain complex wording, synonyms, and long sentences that may express the same concept using different terminology. For example, a lawyer might search for “termination clauses,” but the contract might instead use phrases such as “agreement cancellation,” “right to terminate,” or “contract dissolution.” A keyword search might fail to retrieve these relevant sections because the exact words do not match the query.

In contrast, a vector database enables **semantic search**, which focuses on the meaning of the text rather than exact word matches. In this system, the contract documents would first be divided into smaller sections or paragraphs. Each section would then be converted into a numerical representation called an **embedding** using a language model. These embeddings capture the semantic meaning of the text.

When a lawyer enters a question such as “What are the termination clauses?”, the query is also converted into an embedding. The vector database then performs a similarity search to find the contract sections with embeddings that are most similar to the query embedding. This allows the system to retrieve relevant information even if the wording is different.

Therefore, a vector database plays a key role in enabling efficient semantic search across large legal documents, making it easier for lawyers to locate important clauses quickly and accurately.
