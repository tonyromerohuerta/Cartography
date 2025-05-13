import socket

def communicate_with_satellite(ip, port, command):
    """
    Connects to a satellite and sends a command.
    """
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((ip, port))
            print(f"Connected to satellite at {ip}:{port}")
            
            # Send command
            s.sendall(command.encode())
            print(f"Command sent: {command}")
            
            # Receive response
            response = s.recv(1024).decode()
            print(f"Satellite Response: {response}")
            return response
    
    except Exception as e:
        print(f"Error communicating with satellite: {e}")
        return None