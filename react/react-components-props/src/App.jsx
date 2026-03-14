import 'bootstrap/dist/css/bootstrap.min.css'
import '@fortawesome/fontawesome-free/css/all.css'
import Pedido from './Pedido'
import Cartao from './Cartao'
import Feedback from './Feedback'

  const App = () => {
    const textoOK = "Já chegou"
    const textoNOK = "Ainda não chegou"
    const funcaoOK = () => alert("Agradecemos pela confirmação!")
    const funcaoNOK = () => alert("Verificaremos o ocorrido!")
    const componenteFeedback=<Feedback textoOK={textoOK} funcaoOK={funcaoOK}
      textoNOK={textoNOK} funcaoNOK={funcaoNOK}/>
    return(
      //container principal
      <div className="container border-bottom mt-2">
        {/* linha para o título */}
        <h1 className='display-5 text-center'>Seus pedidos</h1>
            {/* linha para o primeiro pedido */}
          <div className="row">
            {/* controle de colunas para responsividade */}
            <div className="col-sm-8 col-md-6 m-2">
            {/* cartão */}
            <Cartao cabecalho="22/02/2026">
              <Pedido icone="fas fa-hdd fa-2x"
               titulo="SSD" descricao="SSD Kingston A400-SATA"/>
               {componenteFeedback}
            </Cartao>
            </div>
          </div>
          {/* linha para o segundo pedido */}
          <div className="row">
            {/* controle de colunas para responsividade */}
            <div className="col-sm-8 col-md-6 m-2">
            {/* cartão */}
            <Cartao cabecalho="23/02/2026">
              <Pedido icone="fas fa-book fa-2x"
                titulo="Livro" descricao="Concrete Mathematics - Donald Knuth"/>
                {componenteFeedback}
              </Cartao>
            </div>
          </div>
          {/* linha para o terceiro pedido */}
          <div className="row">
            {/* controle de colunas para responsividade */}
            <div className="col-sm-8 col-md-6 m-2">
            {/* cartão */}
            <Cartao cabecalho="20/01/2026">
              <Pedido icone="fas fa-laptop fa-2x"
                titulo="SSD" descricao="Notebook Dell - 8Gb - i5"/>
                {componenteFeedback}
            </Cartao>
            </div>
          </div>
      </div>

    )
  }

  export default App