function Loading({mensagem = 'Carregando'}){
    return (
        <div className="d-flex flex-column justify-content-center
                        align-items-center border rounded p-3">
              
            <div className="spinner-border text-primary"
                 style={{width: '3rem', height: '3rem'}}>
                <span className="visually-hidden">
                    Carregando...
                </span>     
            </div>
            <p className="text-primary mt-2">
            {mensagem}
            </p>
        </div>
    )
}
export default Loading