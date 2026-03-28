#!/bin/bash
# AI Workstation GPU/AI Stack Setup Script
# Futás: bash ai_fix.sh
# Automatikusan ellenőrzi és javítja a GPU / AI könyvtárakat

echo "🚀 AI Workstation GPU/AI javító script indul..."

# 1️⃣ NVIDIA driver ellenőrzés
if command -v nvidia-smi &> /dev/null; then
    echo "✅ NVIDIA driver telepítve:"
    nvidia-smi
else
    echo "❌ NVIDIA driver nincs telepítve! Telepítsd a legfrissebbet a hivatalos NVIDIA oldalról."
    exit 1
fi

# 2️⃣ CUDA ellenőrzés
if command -v nvcc &> /dev/null; then
    echo "✅ CUDA telepítve:"
    nvcc --version
else
    echo "❌ CUDA toolkit nincs telepítve! Telepítsd a CUDA verziót a GPU driverhez illeszkedően."
    exit 1
fi

# 3️⃣ Python virtuális környezet létrehozása
VENV_DIR="$HOME/ai_venv"
if [ ! -d "$VENV_DIR" ]; then
    echo "Python venv létrehozása: $VENV_DIR"
    python3 -m venv "$VENV_DIR"
fi
source "$VENV_DIR/bin/activate"

# 4️⃣ Pip frissítése
pip install --upgrade pip setuptools wheel

# 5️⃣ PyTorch GPU telepítés (CUDA kompatibilis)
echo "PyTorch telepítése GPU támogatással..."
# Alkalmazd a CUDA verziódat: pl. cu118, cu121
pip install --upgrade torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# 6️⃣ OpenVINO telepítése
echo "OpenVINO telepítése..."
pip install --upgrade openvino-dev[onnx,tensorflow]

# 7️⃣ Telepített könyvtárak ellenőrzése
echo "Telepített AI könyvtárak ellenőrzése:"
pip list | grep -E "torch|tensorflow|onnx|openvino|cupy" || echo "ℹ Nincsenek AI könyvtárak"

# 8️⃣ PyTorch GPU teszt
python3 - <<'EOF'
try:
    import torch
    if torch.cuda.is_available():
        print(f"✅ PyTorch GPU elérhető, CUDA verzió: {torch.version.cuda}")
    else:
        print("❌ PyTorch GPU nem elérhető")
except ImportError:
    print("❌ PyTorch nincs telepítve")
EOF

# 9️⃣ TensorFlow GPU teszt
python3 - <<'EOF'
try:
    import tensorflow as tf
    gpus = tf.config.list_physical_devices('GPU')
    if gpus:
        print(f"✅ TensorFlow GPU elérhető: {gpus}")
    else:
        print("❌ TensorFlow GPU nem elérhető")
except ImportError:
    print("❌ TensorFlow nincs telepítve")
EOF

# 10️⃣ OpenVINO GPU teszt
python3 - <<'EOF'
try:
    from openvino.runtime import Core
    core = Core()
    devices = core.available_devices
    print(f"✅ OpenVINO elérhető eszközök: {devices}")
except ImportError:
    print("❌ OpenVINO nincs telepítve")
EOF

echo "--------------------------------------"
echo "🚀 AI Workstation GPU/AI stack setup kész!"
echo "Használd a 'source $VENV_DIR/bin/activate' parancsot a venv aktiválásához."
