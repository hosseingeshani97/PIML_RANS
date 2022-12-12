// Copyright (C) 2022 Tehran University, Author: Hossein Geshani
// SPDX-License-Identifier: (other)
//
// Python-OpenFOAM integration
//
// Initialize python, load module and create some scratch space etc.

int Scalar_FNS = 3;
int Tensor_FNS = 47;

int num_cells = mesh.cells().size();

// 3D array for input feature fields
double q_Scalar_C[Scalar_FNS][num_cells][1];
double q_Tensor_C[Tensor_FNS][num_cells][6];

Info<< "initialize python" << endl;
Py_Initialize();
PyRun_SimpleString("import sys");
PyRun_SimpleString("sys.path.append(\".\")");

// initialize numpy array library
import_array1(-1);

Info<< "    load python_module" << endl;
PyObject *pName = PyUnicode_DecodeFSDefault("python_module"); // Python filename
PyObject *pModule = PyImport_Import(pName);
Py_DECREF(pName);


Info<< "    get CNN function" << endl;
PyObject *CNN_func = PyObject_GetAttrString(pModule, "CNN_func");
PyObject *CNN_args = PyTuple_New(2);

npy_intp dim[] = {1};

double a = 12;
double b = 15;

PyObject *array_a(nullptr);
PyObject *array_b(nullptr);

array_a = PyArray_SimpleNewFromData(1, dim, NPY_DOUBLE, &a);
array_b = PyArray_SimpleNewFromData(1, dim, NPY_DOUBLE, &b);

PyTuple_SetItem(CNN_args, 0, array_a);
PyTuple_SetItem(CNN_args, 1, array_b);

PyArrayObject *pValue = reinterpret_cast<PyArrayObject*>
(
   PyObject_CallObject(CNN_func, CNN_args)
);

// Send data back to OpenFOAM of reconstruction
double urec;
urec = *((double*)PyArray_GETPTR1(pValue, 0));

std::cout<<urec<<std::endl;

Py_DECREF(pModule);
Info<< "..." << endl;

