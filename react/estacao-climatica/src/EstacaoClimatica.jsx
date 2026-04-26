import { useState, useEffect} from 'react'

function EstacaoClimatica({
    icone, estacao, latitude, longitude,
    obterLocalizacao}){

        const [dataAtual, setDataAtual] = useState(null)

        useEffect(() => {
            console.log('timer iniciado')
            const timer = setInterval(() => {
                setDataAtual(new Date().toLocaleTimeString())
            }, 1000)
            return () => {
                console.log('timer cancelado')
                clearInterval(timer)
            }
        }, [])

        return (
            <div className="card">
                <div className="card-body">
                    <div className="d-flex align-items-center border rounded mb-2"
                        style={{ height: '6rem'}}>
                        <i className={`fas fa-5x ${icone}`}></i>
                        <p className="w-75 ms-3 text-center fs-1">
                        {estacao}
                        </p>
                    </div>
                    <div>
                        <p className="text-center">
                        {
                            latitude
                                ? `Coordenadas: ${latitude}, ${longitude}. Data: ${dataAtual}`
                                : 'Clique no botão para saber sua estação'
                        }
                        </p>
                    </div>
                    <button onClick={obterLocalizacao}
                            className="btn btn-outline-primary w-100 mt-2">
                            Qual é minha estação?
                    </button>
                </div>
            </div>
        )
    }

export default EstacaoClimatica