import { useState, useEffect } from 'react'
import axios from 'axios'

const API_URL = 'http://localhost:3000/tarefas'

function App(){
    const [tarefas, setTarefas] = useState([])
    const [titulo, setTitulo] = useState('')
    const [descricao, setDescricao] = useState('')
    const [editandoId, setEditandoId] = useState(null)

    const buscarTarefas = async () => {
        const resposta = await axios.get(API_URL)
        setTarefas(resposta.data)
    }
    useEffect(() => {
        buscarTarefas()
    }, [])

    const adicionarTarefa = async () => {
        if(!titulo.trim()) return
        await axios.post(API_URL, {
            titulo,
            descricao
        })
        setTitulo('')
        setDescricao('')
        buscarTarefas()
        return
    }

    const excluirTarefa = async (id) => {
        await axios.delete(
            `${API_URL}/${id}`
        )
        buscarTarefas()
    }

    const iniciarEdicao = (tarefa) => {
        setEditandoId(tarefa.id)
        setTitulo(tarefa.titulo)
        setDescricao(tarefa.descricao || '')
    }

    const salvarEdicao = async () => {
        if(!titulo.trim()) return
        await axios.put(
            `${API_URL}/${editandoId}`,
            {titulo, descricao}
        )
        setEditandoId(null)
        setTitulo('')
        setDescricao('')
        buscarTarefas()
        
    }

    return(
        <div className="container mt-4">
            <h2 className="text-center mb-4">
            Gerenciador de Tarefas
            </h2>
            <div className="card mb-4">
                <div className="card-body">
                    <h5>Nova Tarefa</h5>
                    <div className="row g-2">
                        <div className="col-md-4">
                            <input type="text" className="form-control"
                              placeholder="Título" value={titulo}
                              onChange={(e) => setTitulo(e.target.value)}
                            />
                        </div>
                        <div className="col-md-5">
                            <input type="text" className="form-control"
                              placeholder="Descrição" value={descricao}
                              onChange={(e) => setDescricao(e.target.value)}
                            />
                        </div>
                        <div className="col=md-3">
                            <button className={`btn ${editandoId
                                ? 'btn-success'
                                : 'btn-primary'} w-100`}
                             onClick={editandoId
                                ? salvarEdicao
                                : adicionarTarefa}>
                             {editandoId? 'Salvar' : 'Adicionar'}
                             </button>
                        </div>
                    </div>
                </div>
            </div>
            {
                tarefas.map((tarefa) => (
                    <div key={tarefa.id} className="card mb-2">
                        <div className="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h5 className="mb-1">
                                {tarefa.titulo}
                                </h5>
                                <p className="text-muted mb-0">
                                {tarefa.descricao}
                                </p>
                            </div>
                            <div>
                                <button className="btn btn-warning btn=sm me-2"
                                 onClick={() => iniciarEdicao(tarefa)}>
                                Editar
                                </button>
                                <button className="btn btn-danger btn=sm me-2"
                                 onClick={() => excluirTarefa(tarefa.id)}>
                                Excluir
                                </button>
                            </div>
                        </div>
                    </div>
                ))
            }
        </div>
    )
}

export default App