// in OpenFOAM the norm() function returns the Frobenius norm of a matrix.
// from my understanding, T.norm() is equal to mag(T) 
// mag(T) is calculated from the equation mag(T) = sqrt(T:T) where ":" is the double dot product sign. (&& in openfoam)

//#include "wallDist.H"

tensor Ei(1,0,0,0,1,0,0,0,1);

volTensorField strain_rate = 0.5*(fvc::grad(U) + T(fvc::grad(U))); //Checked
volTensorField S_h = strain_rate/(mag(epsilon/k) + mag(strain_rate)); //Checked 

//volTensorField rotation_rate = 0.5*(fvm::grad(U) - fvm::grad(T(U))); //Checked	
//volTensorField Omega_h = rotation_rate/(rotation_rate.norm() + rotation_rate.norm()); //Checked


//volVectorField gradP = fvc::grad(P);
//volVectorField grad_P_h = gradP/(rho*mag(U&(grad(U))) + mag(gradP));
//volTensorField A_p_h = -Ei^grad_P_h;

//volVectorField gradk = fvc::grad(k);
//volVectorField grad_k_h = gradk/(mag(epsilon/pow(k,0.5)) + mag(gradk));
//volTensorField A_k_h = -Ei^grad_k_h;

//volScalarField wd = wallDist(mesh).y();

/// Construct vector of scalar features fields 
//vec <volScalarField> q_Scalar;

//q_Scalar.pushback(min(pow(k,0.5)*wd/(50*nu), 2));
//q_Scalar.pushback(k/(mag(k) + nu*mag(strain_rate)));
//q_Scalar.pushback((k/epsilon)/(mag(k/epsilon) + (1/mag(strain_rate))))

/// Construct vector of tensor features fields 
//vec <volTensorField> q_Tensor;

//q_Tensor.pushback(pow(S_h,2));
//q_Tensor.pushback(pow(S_h,3));
//q_Tensor.pushback(pow(Omega_h,2));
//q_Tensor.pushback(pow(A_p_h,2));
//q_Tensor.pushback(pow(A_k_h,2));
//q_Tensor.pushback(pow(Omega_h,2)*S_h);
//q_Tensor.pushback(pow(Omega_h,2)*pow(S_h,2));
//q_Tensor.pushback(pow(Omega_h,2)*S_h*Omega_h*pow(S_h,2));
//q_Tensor.pushback(pow(A_p_h,2)*S_h);
//q_Tensor.pushback(pow(A_p_h,2)*pow(S_h,2));
//q_Tensor.pushback(pow(A_p_h,2)*S_h*A_p_h*pow(S_h,2));
//q_Tensor.pushback(pow(A_k_h,2)*S_h);
//q_Tensor.pushback(pow(A_k_h,2)*pow(S_h,2));
//q_Tensor.pushback(pow(A_k_h,2)*S_h*A_k_h*pow(S_h,2));
//q_Tensor.pushback(Omega_h*A_p_h);
//q_Tensor.pushback(A_p_h*A_k_h);
//q_Tensor.pushback(Omega_h*A_k_h);
//q_Tensor.pushback(Omega_h*A_p_h*S_h);
//q_Tensor.pushback(Omega_h*A_p_h*pow(S_h,2));
//q_Tensor.pushback(pow(Omega_h,2)*A_p_h*S_h);
//q_Tensor.pushback(pow(A_p_h,2)*Omega_h*S_h);
//q_Tensor.pushback(pow(Omega_h,2)*A_p_h*pow(S_h,2));
//q_Tensor.pushback(pow(A_p_h,2)*Omega_h*pow(S_h,2));
//q_Tensor.pushback(pow(Omega_h,2)*S_h*A_p_h*pow(S_h,2));
//q_Tensor.pushback(pow(A_p_h,2)*S_h*Omega_h*pow(S_h,2));
//q_Tensor.pushback(Omega_h*A_k_h*S_h);
//q_Tensor.pushback(Omega_h*A_k_h*pow(S_h,2));
//q_Tensor.pushback(pow(Omega_h,2)*A_k_h*S_h);
//q_Tensor.pushback(pow(A_k_h,2)*Omega_h*S_h);
//q_Tensor.pushback(pow(Omega_h,2)*A_k_h*pow(S_h,2));
//q_Tensor.pushback(pow(A_k_h,2)*Omega_h*pow(S_h,2));
//q_Tensor.pushback(pow(Omega_h,2)*S_h*A_k_h*pow(S_h,2));
//q_Tensor.pushback(pow(A_k_h,2)*S_h*Omega_h*pow(S_h,2));
//q_Tensor.pushback(A_p_h*A_k_h*S_h);
//q_Tensor.pushback(A_p_h*A_k_h*pow(S_h,2));
//q_Tensor.pushback(pow(A_p_h,2)*A_k_h*S_h);
//q_Tensor.pushback(pow(A_k_h,2)*A_p_h*S_h);
//q_Tensor.pushback(pow(A_p_h,2)*A_k_h*pow(S_h,2));
//q_Tensor.pushback(pow(A_k_h,2)*A_p_h*pow(S_h,2));
//q_Tensor.pushback(pow(A_p_h,2)*S_h*A_k_h*pow(S_h,2));
//q_Tensor.pushback(pow(A_k_h,2)*S_h*A_p_h*pow(S_h,2));
//q_Tensor.pushback(Omega_h*A_p_h*A_k_h);
//q_Tensor.pushback(Omega_h*A_p_h*A_k_h*S_h);
//q_Tensor.pushback(Omega_h*A_k_h*A_p_h*S_h);
//q_Tensor.pushback(Omega_h*A_p_h*A_k_h*pow(S_h,2));
//q_Tensor.pushback(Omega_h*A_k_h*A_p_h*pow(S_h,2));
//q_Tensor.pushback(Omega_h*A_p_h*S_h*A_k_h*pow(S_h,2));

