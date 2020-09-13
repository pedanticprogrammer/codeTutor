import io from "socket.io-client";

export function socket(state = io(process.env.PUBLIC_URL), action) {
    switch(action.type) {
        default:
            return state;
    }
}