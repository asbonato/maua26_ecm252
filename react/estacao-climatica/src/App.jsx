function App() {
    window.navigator.geolocation.getCurrentPosition(
        (position) => console.log(position)
    )
    return (
        <div>
            Meu app
        </div>
    )
}

export default App