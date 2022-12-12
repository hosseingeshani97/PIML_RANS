    // Momentum predictor

    MRF.correctBoundaryVelocity(U);
    // using equation 19
    tmp<fvVectorMatrix> tUEqn
    (
        fvm::div(phi, U)
      + MRF.DDt(U)
      - fvm::laplacian((nu+nu_t_L),U)
      - fvc::div((nu+nu_t_L)*dev2(T(fvc::grad(U))))
      - fvc::grad(2/3*nu_t_L*fvc::div(U))
      + fvc::div(tau-tau_L)
     ==
        fvModels.source(U)

    );
    fvVectorMatrix& UEqn = tUEqn.ref();

    UEqn.relax();

    fvConstraints.constrain(UEqn);

    if (simple.momentumPredictor())
    {
        solve(UEqn == -fvc::grad(p));

        fvConstraints.constrain(U);
    }
