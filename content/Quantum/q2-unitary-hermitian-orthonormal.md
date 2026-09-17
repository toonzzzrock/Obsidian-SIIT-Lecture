<!-- #ruleok: gate names X, Y, Z, S, H are exact technical terms, not emphasis -->
# Question 2: Unitary Matrix (Hermitian and Orthonormal)
Source: Chapter 01, slides 4, 9, 12, 19, 22. Flagged by the instructor as challenging.

Course-specific definition used throughout (slide 22): a matrix A is called **unitary** only if it is *both* Hermitian (A* = A) *and* orthonormal (A^-1 = A*) at the same time, which together force A*A = AA* = AA = I. This is stricter than the textbook definition of unitary (which only requires A*A = I); in this course, "orthonormal but not Hermitian" is a separate, weaker category from "unitary."

## Why questions (Q&A)

**Q1. Why does a matrix A need to be Hermitian (A = A*) before the quadratic form v* A v is guaranteed to be a real number, and why does that matter for representing a measurable quantity?**
A. A = A* guarantees real eigenvalues and an orthogonal eigenbasis (spectral theorem), so v* A v is always real for any complex v, which is exactly what is needed when A represents an observable (an expectation value must be a measurable real quantity). If A were not Hermitian, v* A v could be complex, and there would be no physical reading for it as an average measurement outcome.

**Q2. Why is "orthonormal" (A*A = I) the property that makes a matrix a valid reversible gate, while course-unitary (Hermitian and orthonormal at once) is a strictly narrower, extra requirement?**
A. A quantum gate must send every normalized state to another normalized state and must be reversible, since time evolution in an isolated system is reversible; A*A = I is exactly the statement that A preserves the inner product (hence the norm) of every vector and guarantees A is invertible with A^-1 = A*. That alone is enough to be a valid gate (for example S = diag(1,i) is orthonormal). The course additionally calls a matrix "unitary" only when it is Hermitian on top of that, which is a stronger condition most reversible gates do not satisfy.

**Q3. Why does every course-unitary gate (Hermitian and orthonormal simultaneously) have to be self-inverse, while a merely orthonormal gate does not?**
A. If A* = A and A*A = I hold together, substituting gives AA = I, so A^2 = I directly, meaning applying A twice returns the identity: A is self-inverse. This is exactly why X, Y, Z, H, CNOT, CZ, and SWAP (all Hermitian and orthonormal, shown in Math Q3-Q4 below) are the "self-inversible" gates repeatedly highlighted in Chapter 03. S = diag(1,i) is orthonormal (S*S = I) but not Hermitian (S* = diag(1,-i) != S), so AA = I does not follow, and indeed SS|1> = -|1> != |1>, matching the slide's own note that "SS is equivalent to sign flipping" rather than SS = I.

**Q4. Why does multiplying a state by a global phase cis(theta) = e^{i theta} leave <psi|psi> and all measurement probabilities unchanged?**
A. <cis(theta) psi | cis(theta) psi> = conj(cis(theta)) cis(theta) <psi|psi> = |cis(theta)|^2 <psi|psi> = <psi|psi>, since a pure phase factor always has modulus 1. Every measurement probability is |<basis|psi>|^2, and both bra and ket pick up the same phase which then cancels against its own conjugate, so no observable quantity distinguishes |psi> from cis(theta)|psi>. This is why global phase is dropped when counting the physical degrees of freedom of a state (Question 1, Math Q1).

**Q5. Why is orthonormality (not the stronger course-unitary condition) the necessary and sufficient condition for a matrix to represent a valid, reversible quantum gate?**
A. Necessary: any physical evolution of an isolated quantum system must preserve total probability (norm 1 in, norm 1 out) and must be invertible, and norm preservation plus invertibility together force A*A = I, which is orthonormality, not Hermiticity. Sufficient: given any A with A*A = I, A maps the unit sphere in C^2 to itself bijectively, with a well-defined inverse A* to undo it, which is all that is required of a gate. Hermiticity (and hence course-unitarity) is an extra property some gates happen to have, not a requirement for validity as a gate; S, T, and P(theta) are all valid gates despite failing it.

**Q6. Why does the orthonormality check use conj(a(j)) . a(k) rather than a plain real dot product a(j) . a(k)?**
A. The quantum inner product between two complex vectors is defined as <u|v> = conj(u) . v exactly so that <u|u> = sum |u_i|^2 is always real and non-negative (a valid squared norm even when the entries are complex). A plain dot product a(j) . a(k) without conjugation is not guaranteed real for complex vectors and does not correspond to any physical overlap probability, so it cannot be the quantity orthonormality is checked against.

## Math questions (Q&A)

**Q1. Is A = [[1, i], [-i, 1]] Hermitian? Is it orthonormal? Is it course-unitary? Show the full computation.**
A. Conjugate transpose: transpose A gives [[1,-i],[i,1]], then conjugate each entry gives [[1,i],[-i,1]] = A, so A is Hermitian.
For orthonormality, compute A*A. Since A is Hermitian, A* = A, so A*A = A^2.
Entry (1,1): 1*1 + i*(-i) = 1 - i^2 = 2.
Entry (1,2): 1*i + i*1 = 2i.
Entry (2,1): -i*1 + 1*(-i) = -2i.
Entry (2,2): -i*i + 1*1 = 2.
So A^2 = [[2, 2i], [-2i, 2]] = 2A, which is not the identity, so A is not orthonormal, and therefore not course-unitary either (course-unitary requires both). Consistent check: trace(A) = 2, det(A) = 1*1 - i*(-i) = 0, so eigenvalues solve lambda^2 - 2 lambda = 0, giving lambda = 0 and lambda = 2; orthonormal matrices must have all eigenvalues of modulus 1, and 0, 2 fail that.

**Q2. Is the phase gate S = [[1,0],[0,i]] Hermitian? Is it orthonormal? Is it course-unitary? Show the full computation.**
A. Conjugate transpose of S: transpose leaves it unchanged (diagonal), conjugate gives [[1,0],[0,-i]], which is not equal to S (the (2,2) entry flipped from i to -i), so S is not Hermitian.
For orthonormality: S*S = [[1,0],[0,-i]][[1,0],[0,i]] = [[1,0],[0,(-i)(i)]] = [[1,0],[0,1]] = I. So S is orthonormal.
Since S is orthonormal but not Hermitian, it fails the course's definition of unitary: S is a valid reversible gate but is *not* called unitary in this course, unlike X, Y, Z below.

**Q3. Check the Pauli X gate [[0,1],[1,0]] and the Pauli Y gate [[0,-i],[i,0]] for Hermitian, orthonormal, and course-unitary.**
A. X: transpose gives [[0,1],[1,0]] unchanged (real, symmetric), conjugate does nothing since entries are real, so X* = X: Hermitian. X*X = [[0,1],[1,0]][[0,1],[1,0]] = [[1,0],[0,1]] = I: orthonormal. Both hold, so X is course-unitary.
Y: transpose gives [[0,i],[-i,0]], conjugate gives [[0,-i],[i,0]] = Y: Hermitian. Y*Y: entry (1,1) = 0*0 + (-i)(i) = 1; entry (2,2) = i*(-i) + 0*0 = 1; off-diagonal entries are 0, so Y*Y = I: orthonormal. Both hold, so Y is course-unitary. This matches Question 2 Why Q3: X and Y are self-inverse (XX = YY = I) exactly because they are course-unitary, unlike S.

**Q4. Check whether the columns of A = [[1,i],[-i,1]] from Q1 are orthonormal, using the conjugate dot product.**
A. Columns: a(1) = (1,-i), a(2) = (i,1). Orthogonality: conj(a(1)) . a(2) = conj(1)*i + conj(-i)*1 = i + i = 2i, not 0, so the columns are not orthogonal. Norm check: conj(a(1)) . a(1) = |1|^2 + |-i|^2 = 2, not 1, so the columns are not even unit length. Both orthogonality and normalization fail, giving a second, independent confirmation that A is not orthonormal (matching the eigenvalue argument in Q1).

**Q5. Given |psi> = cos(pi/6)|0> + sin(pi/6) e^{i pi/3} |1>, compute <psi|psi> directly, then compute <cis(pi/4) psi | cis(pi/4) psi> and confirm the two match.**
A. <psi|psi> = |cos(pi/6)|^2 + |sin(pi/6) e^{i pi/3}|^2 = cos^2(pi/6) + sin^2(pi/6) * 1 = 1, using |e^{i pi/3}| = 1 and the Pythagorean identity.
Now |cis(pi/4) psi> = e^{i pi/4} cos(pi/6)|0> + e^{i pi/4} sin(pi/6) e^{i pi/3}|1>. Its norm squared is |e^{i pi/4} cos(pi/6)|^2 + |e^{i pi/4} sin(pi/6) e^{i pi/3}|^2 = cos^2(pi/6) + sin^2(pi/6) = 1, since every |e^{i * anything}| = 1. Both equal 1, confirming global phase changes nothing about the norm, exactly as argued in Why Q4.

**Q6. Let M = [[alpha, beta],[gamma, delta]] satisfy M = M* (Hermitian) and M*M = I (orthonormal) simultaneously, i.e. M is course-unitary, as required by the generalized rotation gate construction on Chapter 04 slide 12. Using the Y gate as a concrete instance of M, verify both conditions and state why Y qualifies while S (from Q2) does not.**
A. Y = [[0,-i],[i,0]] was shown Hermitian and orthonormal in Q3, so it is course-unitary (M = M* and M*M = I hold simultaneously) and is a valid choice for M in R_M(theta) = cos(theta/2) I - i sin(theta/2) M. S from Q2 is orthonormal but not Hermitian (S* != S), so S fails the course-unitary requirement and cannot serve as M in that construction; only matrices in the Hermitian-and-orthonormal intersection (such as the Pauli matrices) qualify.
