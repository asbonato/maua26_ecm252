import { useState } from 'react'

function App() {
    const [latitude, setLatitude] = useState(null)
    const [longitude, setLongitude] = useState(null)
    const [estacao, setEstacao] = useState(null)
    const [data, setData] = useState(null)
    const [icone, setIcone] = useState(null)
    const [mensagemDeErro, setMensagemDeErro] = useState(null)

    const obterEstacao = (dataAtual, lat) => {
        const ano = dataAtual.getFullYear()
        const d1 = new Date(ano, 5, 21) // 21/jun/ano
        const d2 = new Date(ano, 8, 24) // 24/set/ano
        const d3 = new Date(ano, 11, 22) // 22/dez/ano
        const d4 = new Date(ano, 2, 21) // 21/mar/ano
        const sul = lat < 0

        if (dataAtual >= d1 && dataAtual < d2)
            return sul ? 'Inverno' : 'Verão'
        if (dataAtual >= d2 && dataAtual < d3)
            return sul ? 'Primavera' : 'Outono'
        if (dataAtual >= d3 || dataAtual < d4)
            return sul ? 'Verão' : 'Inverno'
        return sul ? 'Outono' : 'Primavera'  
    }

    const icones = {
        'Primavera': 'fa-seedling',
        'Verão': 'fa-umbrella-beach',
        'Outono': 'fa-tree',
        'Inverno': 'fa-snowman'
    }

    const obterLocalizacao = () => {
        window.navigator.geolocation.getCurrentPosition(
            (posicao) => {
                const dataAtual = new Date()
                const est = obterEstacao(
                    dataAtual, posicao.coords.latitude
                )
                const ic = icones[est]

                setLatitude(posicao.coords.latitude)
                setLongitude(posicao.coords.longitude)
                setEstacao(est)
                setData(dataAtual.toLocaleString())
                setIcone(ic)
            },
            (erro) => {
                console.log(erro)
                setMensagemDeErro('Tente novamente mais tarde.')
            }
        )
    }

    return (
        //responsividade, margem acima
        <div className="container mt-2">
            {/* linha, conteúdo centralizado */}
            <div className="row justify-content-center">
                {/* 8 colunas em telas médias em diante */}
                <div className='col-md-8'>
                    {/* um cartão Bootstrap */}
                    <div className='card'>
                        {/* corpo do cartão */}
                        <div className='card-body'>
                            {/* centraliza verticalmente, margem abaixo */}
                            <div className='d-flex align-items-center 
                                            border rounded mb-2' 
                                 style={{height: '6rem'}}>
                                {/* ícone obtido do estado */}
                                <i className={`fas fa-5x ${icone}`}></i>
                                {/* largura 75%, margem a esquerda */}
                                <p className='w-75 ms-3 text-center fs-1'>
                                    {estacao}
                                </p>
                            </div>
                            <div>
                                <p className="text-center">
                                    {
                                        latitude
                                        ? `Coordenadas: ${latitude}, ${longitude}. Data: ${data}`
                                        : mensagemDeErro
                                          ? mensagemDeErro
                                          : 'Clique no botão para saber sua estação climática.'
                                    }
                                </p>
                            </div>
                            <button className='btn btn-outline-primary w-100 mt-2'
                                    onClick={obterLocalizacao}>
                                    Qual a minha estação?
                            </button>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
    )
}

export default App




