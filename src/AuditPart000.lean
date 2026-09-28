import AcceptedRestrictions
import ActivePools
import AllWeightSectorAllocation
import ApproximateProfiles
import ApproximateTypes
import AsymptoticSum
import BatchPowers
import BatchRepair
import BatchRestrictions
import BatchSymmetry
import BehrendRetention
import BlockConcentration
import CWActiveCollisions
import CWActiveLaws
import CWActualSelection
import CWApproximateCosts
import CWApproximateMixedExtraction
import CWAsymptoticApproximateExtraction
import CWAsymptoticContextualExtraction
import CWAsymptoticDegrees
import CWAxisPermutations
import CWAxisPooling
import CWCoarseData
import CWCoarseEntropy
import CWCoarseGraph
import CWCoarseHalves
import CWCoarseOwnership
import CWCoarseRates
import CWCollisionCounts
import CWCompatibilityNecessary
import CWCompatibilityRates
import CWCompatibleCollisions
import CWConstituents
import CWContextualApproximateExtraction
import CWContextualNearbyExtraction
import CWContextualProfileGluing
import CWContextualReprofile
import CWDegreeControl
import CWDegreeControlShrink
import CWExactCoarseRates
import CWExactGibbs
import CWExactProfileValidity
import CWExtractedTargets
import CWExtractionOverhead
import CWExtractionSchedule
import CWFiberCounts
import CWFineCollisionCounts
import CWFineCompatibility
import CWFiniteContextualExtraction
import CWFiniteExtraction
import CWFiniteMixedExtraction
import CWFiniteRootExtraction
import CWInterfaceSize
import CWLawStability
import CWMixedActualCounts
import CWMixedCollisionCounts
import CWMixedConcentration
import CWMixedContextualPrime
import CWMixedContextualRates
import CWMixedContextualRepair
import CWMixedContextualSource
import CWMixedContextualTargets
import CWMixedDegreeRates
import CWMixedDegrees
import CWMixedEntropyExtraction
import CWMixedEvents
import CWMixedExtractedTargets
import CWMixedGraph
import CWMixedHash
import CWMixedNearbyExtraction
import CWMixedNearbySource
import CWMixedNominalRates
import CWMixedOwnership
import CWMixedOwnershipData
import CWMixedPrepared
import CWMixedPrimeExtraction
import CWMixedProfileFacts
import CWMixedProfileGluing
import CWMixedProfiles
import CWMixedRateExtraction
import CWMixedRepairedTargets
import CWMixedSelection
import CWMixedSource
import CWMixedSumInterfaces
import CWMixedTargetCoefficients
import CWMixedTargetOwnership
import CWMixedTargetSymmetry
import CWMixedTargets
import CWMixedWindowedOwners
import CWNearbyDegreeRates
import CWNearbyParameters
import CWNearbyWindows
import CWNominalCopyRates
import CWNominalRetentionLoss
import CWOneLetterData
import CWOneLetterDimensions
import CWOneLetterEntropy
import CWOneLetterInterfaces
import CWOneLetterMatrices
import CWOneLetterMatrixVolume
import CWOneLetterProfileLaws
import CWOneLetterWindowedMatrix
import CWPairing
import CWParentCenterBounds
import CWParentCompatibility
import CWParentHoles
import CWPartition
import CWPermutedCoarseData
import CWPermutedTerminalAsymptotic
import CWPermutedTerminalCoarse
import CWPermutedTerminalCountScaling
import CWPermutedTerminalData
import CWPermutedTerminalDegreeControl
import CWPermutedTerminalExtraction
import CWPermutedTerminalGibbs
import CWPermutedTerminalInterfaces
import CWPermutedTerminalLaws
import CWPermutedTerminalMatrices
import CWPermutedTerminalMixedTarget
import CWPermutedTerminalNominal
import CWPermutedTerminalRateBounds
import CWPermutedTerminalRates
import CWPermutedTerminalWindowTarget
import CWPhysicalWindowFamilies
import CWPhysicalWindowInverse
import CWPhysicalWindows
import CWPooledCompatibility
import CWPooledDegrees
import CWPrescribedGraph
import CWProfileLaws
import CWRationalCanonicalAssembly
import CWRationalCanonicalInterfaces
import CWRationalChildren
import CWRationalData
import CWRationalLawValidity
import CWRationalMixedExtraction
import CWRationalMixedRates
import CWRationalOrbitParents
import CWRationalOrbitRates
import CWRationalOrientedChildren

/-! Generated dependency audit of named local declarations. -/

#print axioms MatrixBounds.Empirical.accepted_nonzero
#print axioms MatrixBounds.Empirical.acceptedCertificate
#print axioms MatrixBounds.Empirical.restrict_narrower_accepted
#print axioms MatrixBounds.Empirical.narrowerAcceptedCertificate
#print axioms MatrixBounds.Interface.ActivePool
#print axioms MatrixBounds.Interface.includeActive
#print axioms MatrixBounds.Interface.activePoolNonempty
#print axioms MatrixBounds.Interface.active_pool_identity
#print axioms MatrixBounds.Interface.contextReduction_drop_empty_pools
#print axioms MatrixBounds.Interface.contextReduction_allocate_all_weights
#print axioms MatrixBounds.Interface.contextReduction_allocate_all_roles
#print axioms MatrixBounds.Empirical.ProfileWithin
#print axioms MatrixBounds.Empirical.ActiveProfileWithin
#print axioms MatrixBounds.Empirical.profileWithin_profileOf
#print axioms MatrixBounds.Empirical.activeProfileWithin_nonempty
#print axioms MatrixBounds.Empirical.split_profile_close
#print axioms MatrixBounds.Empirical.Within
#print axioms MatrixBounds.Empirical.within_shift
#print axioms MatrixBounds.Empirical.within_mono
#print axioms MatrixBounds.Empirical.nearby_parent_window
#print axioms MatrixBounds.Empirical.mixture_parent_window
#print axioms MatrixBounds.Empirical.empirical_probability_range
#print axioms MatrixBounds.Empirical.exists_within_entropy_control
#print axioms MatrixBounds.MatrixComplexity.exponent_le_of_batch
#print axioms MatrixBounds.MatrixComplexity.exponent_le_of_batch_degeneration
#print axioms MatrixBounds.MatrixComplexity.batchProductMap
#print axioms MatrixBounds.MatrixComplexity.squareBatch_product_identity
#print axioms MatrixBounds.MatrixComplexity.squareBatch_product
#print axioms MatrixBounds.MatrixComplexity.squareBatch_power
#print axioms MatrixBounds.MatrixComplexity.batchCertificateProduct
#print axioms MatrixBounds.MatrixComplexity.batchCertificatePower
#print axioms MatrixBounds.Tensor.Symmetry.broken_batch_identity
#print axioms MatrixBounds.Tensor.Symmetry.batch_linear_repair_rank
#print axioms MatrixBounds.Tensor.batchMap
#print axioms MatrixBounds.Tensor.restrict_batch
#print axioms MatrixBounds.Tensor.BatchReduction
#print axioms MatrixBounds.Tensor.batchReduction_restrict
#print axioms MatrixBounds.Tensor.batchReduction_pullback
#print axioms MatrixBounds.Tensor.BatchReduction.refl
#print axioms MatrixBounds.Tensor.BatchReduction.trans
#print axioms MatrixBounds.Tensor.BatchReduction.apply_certificate
#print axioms MatrixBounds.Tensor.Symmetry.batchAction
#print axioms MatrixBounds.Tensor.Symmetry.batchActionTransitive
#print axioms MatrixBounds.Tensor.Symmetry.batch_invariant
#print axioms MatrixBounds.Tensor.Symmetry.batch_parts_equivariant
#print axioms MatrixBounds.Tensor.Symmetry.batch_hole_count
#print axioms MatrixBounds.Tensor.Symmetry.batch_holes_bound
#print axioms MatrixBounds.HashBuckets.half_modulus_lower
#print axioms MatrixBounds.HashBuckets.bucket_lower_simple
#print axioms MatrixBounds.HashBuckets.surviving_count_lower
#print axioms MatrixBounds.HashBuckets.surviving_count_exponential
#print axioms MatrixBounds.HashBuckets.square_root_loss
#print axioms MatrixBounds.Empirical.twoEmbedding
#print axioms MatrixBounds.Empirical.blockEvent
#print axioms MatrixBounds.Empirical.blockCenter
#print axioms MatrixBounds.Empirical.blockSlots
#print axioms MatrixBounds.Empirical.blockCenter_bounds
#print axioms MatrixBounds.Empirical.block_single_error
#print axioms MatrixBounds.Empirical.block_joint_error
#print axioms MatrixBounds.Empirical.block_frequency_concentration
#print axioms MatrixBounds.Empirical.all_block_frequencies_concentration
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.graph_valid
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.bucket_active
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.active_shared_y_bucket
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.active_shared_z_bucket
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.actual_coarse_collision_count
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.activeLaw
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.activeLaw_range
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.split_complement_eq
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.parentLaw_active
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.pooledLaw_active
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.lawRetention_active
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.childLaw_close_active
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.SelectedEdges
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.uniform_coarse_collision_count
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.exists_actual_selection
#print axioms MatrixBounds.Tensor.CW.Mixed.profileDimension
#print axioms MatrixBounds.Tensor.CW.Mixed.child_population_bound
#print axioms MatrixBounds.Tensor.CW.Mixed.child_profile_count_bound
#print axioms MatrixBounds.Tensor.CW.Mixed.child_profile_cost_eventually
#print axioms MatrixBounds.RepairRates.repair_cost_eventually
#print axioms MatrixBounds.Tensor.CW.Mixed.finite_approximate_mixed_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.eventual_approximate_mixed_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.eventual_contextual_approximate_extraction
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.exists_eventual_fine_rate
#print axioms MatrixBounds.Tensor.CW.transposeShape
#print axioms MatrixBounds.Tensor.CW.cyclicShape
#print axioms MatrixBounds.Tensor.CW.tensor_transpose
#print axioms MatrixBounds.Tensor.CW.word_tensor_transpose
#print axioms MatrixBounds.Tensor.CW.cyclic_constituent
#print axioms MatrixBounds.Tensor.CW.transposeXY_constituent
#print axioms MatrixBounds.Tensor.CW.cyclic_windowed_constituent
#print axioms MatrixBounds.Tensor.CW.transposeXY_windowed_constituent
#print axioms MatrixBounds.Tensor.CW.parentFine
#print axioms MatrixBounds.Tensor.CW.axisChildIndex
#print axioms MatrixBounds.Tensor.CW.axisChildIndex_eq
#print axioms MatrixBounds.Tensor.CW.pooledAxisType
#print axioms MatrixBounds.Tensor.CW.fullChildType
#print axioms MatrixBounds.Tensor.CW.pooled_y_of_agreement
#print axioms MatrixBounds.Tensor.CW.pooled_z_of_agreement
#print axioms MatrixBounds.Tensor.CW.hashed_parent_factors
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.fromCoarse
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.fromCoarseReference
#print axioms MatrixBounds.Tensor.CW.RootRestrictionData.fromCoarse
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.coarseDegreeExponent
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.coarse_fiber_entropy
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.coarse_degree_entropy
#print axioms MatrixBounds.Tensor.CW.SplitAlphabet
#print axioms MatrixBounds.Tensor.CW.splitX
#print axioms MatrixBounds.Tensor.CW.splitY
#print axioms MatrixBounds.Tensor.CW.splitZ
#print axioms MatrixBounds.Tensor.CW.splitXIndex
#print axioms MatrixBounds.Tensor.CW.splitYIndex
#print axioms MatrixBounds.Tensor.CW.splitZIndex
#print axioms MatrixBounds.Tensor.CW.CoarseWords
#print axioms MatrixBounds.Tensor.CW.splitWordEdge
#print axioms MatrixBounds.Tensor.CW.splitWordEdge_valid
#print axioms MatrixBounds.Tensor.CW.splitWordEdge_injective
#print axioms MatrixBounds.Tensor.CW.splitWord_xy_injective
#print axioms MatrixBounds.Tensor.CW.splitWord_xz_injective
#print axioms MatrixBounds.Tensor.CW.splitWord_small
#print axioms MatrixBounds.Tensor.CW.coarseFiltered
#print axioms MatrixBounds.Tensor.CW.coarseFiltered_complete
#print axioms MatrixBounds.Tensor.CW.wordCoarse_le
#print axioms MatrixBounds.Tensor.CW.wordCoarseIndex
#print axioms MatrixBounds.Tensor.CW.leftHalf
#print axioms MatrixBounds.Tensor.CW.rightHalf
#print axioms MatrixBounds.Tensor.CW.concatenate_halves
#print axioms MatrixBounds.Tensor.CW.wordCoarse_halves
#print axioms MatrixBounds.Tensor.CW.wordPower_halves
#print axioms MatrixBounds.Tensor.CW.leftChildAxis
#print axioms MatrixBounds.Tensor.CW.rightChildAxis
#print axioms MatrixBounds.Tensor.CW.leftShape
#print axioms MatrixBounds.Tensor.CW.leftShape_fits
#print axioms MatrixBounds.Tensor.CW.leftShape_total
#print axioms MatrixBounds.Tensor.CW.actualLeftSymbol
#print axioms MatrixBounds.Tensor.CW.parentCoarseMod
#print axioms MatrixBounds.Tensor.CW.coarseGraphEdges
#print axioms MatrixBounds.Tensor.CW.coarseFiltered_mod_valid
#print axioms MatrixBounds.Tensor.CW.coarseFiltered_mod_complete
#print axioms MatrixBounds.Tensor.CW.hashedCoarseParent
#print axioms MatrixBounds.Tensor.CW.parentCoarseOwner
#print axioms MatrixBounds.Tensor.CW.parentCoarseOwner_forces
#print axioms MatrixBounds.Tensor.CW.hashedCoarseParentCertificate
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.gibbsCost
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.coarseRetention
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.coarseErrorConstant
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.scaled_log_weights
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.coarseDegreeExponent_eq
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.coarse_degree_rate
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.exists_uniform_coarse_rate
#print axioms MatrixBounds.Tensor.CW.WordBucket
#print axioms MatrixBounds.Tensor.CW.wordCollision
#print axioms MatrixBounds.Tensor.CW.shared_x_word_count
#print axioms MatrixBounds.Tensor.CW.shared_y_word_count
#print axioms MatrixBounds.Tensor.CW.shared_z_word_count
#print axioms MatrixBounds.Tensor.CW.sector_count_transport
#print axioms MatrixBounds.Tensor.CW.shapeYIndex
#print axioms MatrixBounds.Tensor.CW.shapeZIndex
#print axioms MatrixBounds.Tensor.CW.yClass_partial
#print axioms MatrixBounds.Tensor.CW.zClass_partial
#print axioms MatrixBounds.Tensor.CW.zero_z_sector_type
#print axioms MatrixBounds.Tensor.CW.y_compatibility_necessary
#print axioms MatrixBounds.Tensor.CW.zero_xy_sector_type
#print axioms MatrixBounds.Tensor.CW.z_compatibility_necessary
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.fineRetention
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.fineErrorConstant
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.compatibilityCost_bound
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.fine_error_bound
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.exists_uniform_fine_rate
#print axioms MatrixBounds.Tensor.CW.admissibleWord
#print axioms MatrixBounds.Tensor.CW.admissibleWord_injective
#print axioms MatrixBounds.Tensor.CW.other_compatible_count_le
#print axioms MatrixBounds.Tensor.CW.coarse_x_collision_count
#print axioms MatrixBounds.Tensor.CW.compatible_y_collision_count
#print axioms MatrixBounds.Tensor.CW.compatible_z_collision_count
#print axioms MatrixBounds.Tensor.CW.AxisVariable
#print axioms MatrixBounds.Tensor.CW.constituent
#print axioms MatrixBounds.Tensor.CW.constituentCertificate
#print axioms MatrixBounds.Tensor.CW.constituent_support
#print axioms MatrixBounds.Tensor.CW.fineTotal
#print axioms MatrixBounds.Tensor.CW.fine_part_total
#print axioms MatrixBounds.Tensor.CW.liftFine
#print axioms MatrixBounds.Tensor.CW.fineLabel_lift
#print axioms MatrixBounds.Tensor.CW.liftFineWord
#print axioms MatrixBounds.Tensor.CW.fineWord_lift
#print axioms MatrixBounds.Tensor.CW.fine_part_surjective
#print axioms MatrixBounds.Tensor.CW.Mixed.finite_contextual_approximate_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.finite_contextual_nearby_profile_batch
#print axioms MatrixBounds.Tensor.CW.Mixed.contextReduction_glue_mixed_profiles
#print axioms MatrixBounds.Tensor.CW.Mixed.contextReduction_narrowerParent
#print axioms MatrixBounds.Tensor.CW.Mixed.contextReduction_reprofileSource
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.DegreeControl
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.degreeControl_exists
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.degreeControl
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.windowDegree_mono
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.DegreeControl.shrink
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.degreeControl_arbitrarily_small
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.complete_graph_count
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.complete_fiber_ratio
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.complete_coarse_degree_rate
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.gibbsCost_exact
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.coarseRetention_of_exact_gibbs
#print axioms MatrixBounds.Tensor.CW.exact_profile_supported
#print axioms MatrixBounds.Tensor.CW.ExactProfilesValid
#print axioms MatrixBounds.Tensor.CW.exact_profiles_valid
#print axioms MatrixBounds.Tensor.CW.exact_invalid_zero
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.damagedTargetBatch
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.damagedTargetCertificate
#print axioms MatrixBounds.Tensor.CW.Mixed.extractionOverhead
#print axioms MatrixBounds.Tensor.CW.Mixed.extraction_overhead_eventually
#print axioms MatrixBounds.Tensor.CW.Mixed.population_thresholds
#print axioms MatrixBounds.Tensor.CW.Mixed.exists_approximate_schedule
#print axioms MatrixBounds.Tensor.CW.middleFiberEquiv
#print axioms MatrixBounds.Tensor.CW.coarse_eq_two
#print axioms MatrixBounds.Tensor.CW.fine_fiber_card
#print axioms MatrixBounds.Tensor.CW.fineWordFiberEquiv
#print axioms MatrixBounds.Tensor.CW.fine_word_fiber_card
#print axioms MatrixBounds.Tensor.CW.axisFineFiberEquiv
#print axioms MatrixBounds.Tensor.CW.axis_fine_fiber_card
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.FineCompetitors
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.fineCompetitors_card_le
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.fine_collision_transfer
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.actual_y_collision_count
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.actual_z_collision_count
#print axioms MatrixBounds.Empirical.count_map_equiv
#print axioms MatrixBounds.Empirical.hasType_map_equiv
#print axioms MatrixBounds.Tensor.CW.fineLabel
#print axioms MatrixBounds.Tensor.CW.fineWord
#print axioms MatrixBounds.Tensor.CW.fineComplement
#print axioms MatrixBounds.Tensor.CW.zero_z_fine_word
#print axioms MatrixBounds.Tensor.CW.zero_z_type_forced
#print axioms MatrixBounds.Tensor.CW.zero_x_type_forced
#print axioms MatrixBounds.Tensor.CW.zero_y_type_forced
#print axioms MatrixBounds.Tensor.CW.zero_y_type_forced_from_x
#print axioms MatrixBounds.Tensor.CW.Mixed.finite_contextual_mixed_extraction
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.parentWindow
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.parentRepairConstant
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.selected_holes_bound
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.finite_split_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.finite_mixed_extraction
#print axioms MatrixBounds.Tensor.CW.RootRestrictionData.finite_root_extraction
#print axioms MatrixBounds.Tensor.CW.ExactAxis
#print axioms MatrixBounds.Tensor.CW.exact_axis_card_le
#print axioms MatrixBounds.Tensor.CW.exact_axis_binary_bound
#print axioms MatrixBounds.Tensor.CW.exact_batch_cube_bound
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.parentLaw_range
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.pooledLaw_range
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.parentLaw_close
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.pooledLaw_close
#print axioms MatrixBounds.Tensor.CW.Mixed.actual_coarse_collision_count
#print axioms MatrixBounds.Tensor.CW.Mixed.FineCompetitors
#print axioms MatrixBounds.Tensor.CW.Mixed.fine_collision_transfer
#print axioms MatrixBounds.Tensor.CW.Mixed.actual_y_collision_count
#print axioms MatrixBounds.Tensor.CW.Mixed.actual_z_collision_count
#print axioms MatrixBounds.Tensor.CW.Mixed.Bucket
#print axioms MatrixBounds.Tensor.CW.Mixed.Collision
#print axioms MatrixBounds.Tensor.CW.Mixed.shared_x_count
#print axioms MatrixBounds.Tensor.CW.Mixed.shared_y_count
#print axioms MatrixBounds.Tensor.CW.Mixed.shared_z_count
#print axioms MatrixBounds.Tensor.CW.Mixed.parentWindows
#print axioms MatrixBounds.Tensor.CW.Mixed.parentRepairConstant
#print axioms MatrixBounds.Tensor.CW.Mixed.parentHole_bound
#print axioms MatrixBounds.Tensor.CW.Mixed.targetHoles_windowed_bound
#print axioms MatrixBounds.Tensor.CW.Mixed.finite_contextual_prime_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.finite_contextual_rate_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.contextReduction_repairedTargets
#print axioms MatrixBounds.Tensor.CW.Mixed.contextReduction_prepare
#print axioms MatrixBounds.Tensor.CW.Mixed.contextReduction_windowedPieces
#print axioms MatrixBounds.Tensor.CW.Mixed.contextReduction_identifyTargets
#print axioms MatrixBounds.Tensor.CW.Mixed.prescribed_positive
#print axioms MatrixBounds.Tensor.CW.Mixed.coarse_product_positive
#print axioms MatrixBounds.Tensor.CW.Mixed.degree_product_retention
#print axioms MatrixBounds.Tensor.CW.Mixed.FineWords
#print axioms MatrixBounds.Tensor.CW.Mixed.Compatible
#print axioms MatrixBounds.Tensor.CW.Mixed.compatible_degree_le
#print axioms MatrixBounds.Tensor.CW.Mixed.window_degree_le
#print axioms MatrixBounds.Tensor.CW.Mixed.coarse_degree_le
#print axioms MatrixBounds.Tensor.CW.Mixed.finite_mixed_entropy_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.coarseCollision
#print axioms MatrixBounds.Tensor.CW.Mixed.fineCollision
#print axioms MatrixBounds.Tensor.CW.Mixed.bucket_active
#print axioms MatrixBounds.Tensor.CW.Mixed.active_shared_y_bucket
#print axioms MatrixBounds.Tensor.CW.Mixed.active_shared_z_bucket
#print axioms MatrixBounds.Tensor.CW.Mixed.coarseOwner_of_no_collision
#print axioms MatrixBounds.Tensor.CW.Mixed.damagedTargetBatch
#print axioms MatrixBounds.Tensor.CW.Mixed.damagedTargetCertificate
#print axioms MatrixBounds.Tensor.CW.Mixed.Edges
#print axioms MatrixBounds.Tensor.CW.Mixed.PrescribedEdges
#print axioms MatrixBounds.Tensor.CW.Mixed.forget
#print axioms MatrixBounds.Tensor.CW.Mixed.forget_injective
#print axioms MatrixBounds.Tensor.CW.Mixed.naturalEdge
#print axioms MatrixBounds.Tensor.CW.Mixed.total
#print axioms MatrixBounds.Tensor.CW.Mixed.naturalEdge_valid
#print axioms MatrixBounds.Tensor.CW.Mixed.naturalEdge_xy_injective
#print axioms MatrixBounds.Tensor.CW.Mixed.naturalEdge_xz_injective
#print axioms MatrixBounds.Tensor.CW.Mixed.naturalEdge_small
#print axioms MatrixBounds.Tensor.CW.Mixed.prescribed_card
#print axioms MatrixBounds.Tensor.CW.selected_word_nonzero
#print axioms MatrixBounds.Tensor.CW.heterogeneous_selected_totals
#print axioms MatrixBounds.Tensor.CW.heterogeneous_shared_hash
#print axioms MatrixBounds.Tensor.CW.Mixed.nominalRetention
#print axioms MatrixBounds.Tensor.CW.Mixed.nominalCopies
#print axioms MatrixBounds.Tensor.CW.Mixed.finite_nearby_profile_batch
#print axioms MatrixBounds.Tensor.CW.Mixed.nearbySourceCertificate
#print axioms MatrixBounds.Tensor.CW.Mixed.nominalCoarseRate
#print axioms MatrixBounds.Tensor.CW.Mixed.nominalFineRate
#print axioms MatrixBounds.Tensor.CW.Mixed.reprofile_coarse_rate
#print axioms MatrixBounds.Tensor.CW.Mixed.reprofile_fine_rate
#print axioms MatrixBounds.Tensor.CW.Mixed.necessaryY
#print axioms MatrixBounds.Tensor.CW.Mixed.necessaryZ
#print axioms MatrixBounds.Tensor.CW.Mixed.owners_disjoint
#print axioms MatrixBounds.Tensor.CW.Mixed.extractionCertificate
#print axioms MatrixBounds.Tensor.CW.Mixed.prescribed
#print axioms MatrixBounds.Tensor.CW.Mixed.active
#print axioms MatrixBounds.Tensor.CW.Mixed.Full
#print axioms MatrixBounds.Tensor.CW.Mixed.ownerX
#print axioms MatrixBounds.Tensor.CW.Mixed.compatibleY
#print axioms MatrixBounds.Tensor.CW.Mixed.compatibleZ
#print axioms MatrixBounds.Tensor.CW.Mixed.pooledSource
#print axioms MatrixBounds.Tensor.CW.Mixed.ownerX_facts
#print axioms MatrixBounds.Tensor.CW.Mixed.hashedSource_factors
#print axioms MatrixBounds.Tensor.CW.Mixed.parentSource
#print axioms MatrixBounds.Tensor.CW.Mixed.coarseTest
#print axioms MatrixBounds.Tensor.CW.Mixed.windowTest
#print axioms MatrixBounds.Tensor.CW.Mixed.parentInterface
#print axioms MatrixBounds.Tensor.CW.Mixed.coarseSource_eq
#print axioms MatrixBounds.Tensor.CW.Mixed.parentInterface_eq
#print axioms MatrixBounds.Tensor.CW.Mixed.preparedSource
#print axioms MatrixBounds.Tensor.CW.Mixed.prepared_eq_pooled
#print axioms MatrixBounds.Tensor.CW.Mixed.prepareInterfaceCertificate
#print axioms MatrixBounds.Tensor.CW.Mixed.finite_mixed_prime_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.reprofileReference
#print axioms MatrixBounds.Tensor.CW.Mixed.reprofile_symmetric
#print axioms MatrixBounds.Tensor.CW.Mixed.valid_profiles_representatives
#print axioms MatrixBounds.Tensor.CW.Mixed.accepted_childLaw_close
#print axioms MatrixBounds.Tensor.CW.Mixed.ChildIndex
#print axioms MatrixBounds.Tensor.CW.Mixed.ChildSlots
#print axioms MatrixBounds.Tensor.CW.Mixed.approximateTarget
#print axioms MatrixBounds.Tensor.CW.Mixed.glue_mixed_profile_batches
#print axioms MatrixBounds.Tensor.CW.Mixed.ChildProfileTuple
#print axioms MatrixBounds.Tensor.CW.Mixed.profileCounts
#print axioms MatrixBounds.Tensor.CW.Mixed.ValidProfiles
#print axioms MatrixBounds.Tensor.CW.Mixed.reprofile
#print axioms MatrixBounds.Tensor.CW.Mixed.profileTarget
#print axioms MatrixBounds.Tensor.CW.Mixed.target_reprofile
#print axioms MatrixBounds.Tensor.CW.Mixed.profileTarget_valid
#print axioms MatrixBounds.Tensor.CW.Mixed.profileTarget_invalid_zero
#print axioms MatrixBounds.Tensor.CW.Mixed.invalid_profile_batch
#print axioms MatrixBounds.Tensor.CW.Mixed.profilesAccepted
#print axioms MatrixBounds.Tensor.CW.Mixed.mixedRetention
#print axioms MatrixBounds.Tensor.CW.Mixed.finite_mixed_rate_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.repairGrowth
#print axioms MatrixBounds.Tensor.CW.Mixed.repairedTargets_rank
#print axioms MatrixBounds.Tensor.CW.Mixed.windowCollision
#print axioms MatrixBounds.Tensor.CW.Mixed.window_collision_count
#print axioms MatrixBounds.Tensor.CW.Mixed.SelectedEdges
#print axioms MatrixBounds.Tensor.CW.Mixed.exists_actual_selection
#print axioms MatrixBounds.Tensor.CW.Mixed.Axis
#print axioms MatrixBounds.Tensor.CW.Mixed.axisCoarse
#print axioms MatrixBounds.Tensor.CW.Mixed.coarseSource
#print axioms MatrixBounds.Tensor.CW.Mixed.coarseSource_factors
#print axioms MatrixBounds.Tensor.CW.Mixed.coarseSource_complete
#print axioms MatrixBounds.Tensor.CW.Mixed.coarseSource_valid
#print axioms MatrixBounds.Tensor.CW.Mixed.hashedSource
#print axioms MatrixBounds.Tensor.CW.Mixed.globalOwner
#print axioms MatrixBounds.Tensor.CW.Mixed.globalOwner_forces
#print axioms MatrixBounds.Tensor.CW.Mixed.sumPositionsFintype
#print axioms MatrixBounds.Tensor.CW.Mixed.sumPositionsNonempty
#print axioms MatrixBounds.Tensor.CW.Mixed.sumData
#print axioms MatrixBounds.Tensor.CW.Mixed.sumLaw
#print axioms MatrixBounds.Tensor.CW.Mixed.sumApproximateRestriction
#print axioms MatrixBounds.Tensor.CW.Mixed.sumParentRestriction
#print axioms MatrixBounds.Tensor.CW.Mixed.mapped_target_coefficient
#print axioms MatrixBounds.Tensor.CW.Mixed.parentHole
#print axioms MatrixBounds.Tensor.CW.Mixed.targetHoles
#print axioms MatrixBounds.Tensor.CW.Mixed.targetAxis_mod
#print axioms MatrixBounds.Tensor.CW.Mixed.target_window_iff
#print axioms MatrixBounds.Tensor.CW.Mixed.target_ownerX_iff
#print axioms MatrixBounds.Tensor.CW.Mixed.target_ownerY_iff
#print axioms MatrixBounds.Tensor.CW.Mixed.target_ownerZ_iff
#print axioms MatrixBounds.Tensor.CW.Mixed.TargetGroup
#print axioms MatrixBounds.Tensor.CW.Mixed.targetParts_equivariant
#print axioms MatrixBounds.Tensor.CW.Mixed.targetParts_transitive
#print axioms MatrixBounds.Tensor.CW.Mixed.target_invariant
#print axioms MatrixBounds.Tensor.CW.Mixed.product_binary_bound
#print axioms MatrixBounds.Tensor.CW.Mixed.target_axis_binary_bound
#print axioms MatrixBounds.Tensor.CW.Mixed.selected_binary_bound
#print axioms MatrixBounds.Tensor.CW.Mixed.target_batch_cube_bound
#print axioms MatrixBounds.Tensor.CW.Mixed.target
#print axioms MatrixBounds.Tensor.CW.Mixed.TargetAxis
#print axioms MatrixBounds.Tensor.CW.Mixed.TargetParts
#print axioms MatrixBounds.Tensor.CW.Mixed.targetParts
#print axioms MatrixBounds.Tensor.CW.Mixed.targetAxis
#print axioms MatrixBounds.Tensor.CW.Mixed.target_identity
#print axioms MatrixBounds.Tensor.CW.Mixed.targetFine
#print axioms MatrixBounds.Tensor.CW.Mixed.targetAxis_fine
#print axioms MatrixBounds.Tensor.CW.Mixed.targetAxis_full
#print axioms MatrixBounds.Tensor.CW.Mixed.targetAxis_compatible
#print axioms MatrixBounds.Tensor.CW.Mixed.targetParts_compatible
#print axioms MatrixBounds.Tensor.CW.Mixed.windowOwnerX
#print axioms MatrixBounds.Tensor.CW.Mixed.windowOwnerY
#print axioms MatrixBounds.Tensor.CW.Mixed.windowOwnerZ
#print axioms MatrixBounds.Tensor.CW.Mixed.windowedPieces
#print axioms MatrixBounds.Tensor.CW.Mixed.windowedPiecesCertificate
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.exists_uniform_nearby_degree_rate
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.nearbyTolerance
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.nearbyTolerance_positive
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.NearbyParameters
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.nearbyParameters
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.NearbyParameters.degree_bound
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.nearby_profile_window
#print axioms MatrixBounds.Tensor.CW.Mixed.nominalWindows
#print axioms MatrixBounds.Tensor.CW.Mixed.narrowerParentCertificate
#print axioms MatrixBounds.Tensor.CW.Mixed.prescribed_edges_exponential
#print axioms MatrixBounds.Tensor.CW.Mixed.nominal_copies_eventually
#print axioms MatrixBounds.Tensor.CW.Mixed.mixedRetention_sub
#print axioms MatrixBounds.Tensor.CW.Mixed.nominalRetention_error
#print axioms MatrixBounds.Tensor.CW.Mixed.nominalRetention_lower
#print axioms MatrixBounds.Tensor.CW.shapeXIndex
#print axioms MatrixBounds.Tensor.CW.oneLetterProfile_complement
#print axioms MatrixBounds.Tensor.CW.oneLetterData
#print axioms MatrixBounds.Tensor.CW.oneLetterRepresentative
#print axioms MatrixBounds.Tensor.CW.oneLetterRepresentativeX
#print axioms MatrixBounds.Tensor.CW.oneLetterRepresentativeY
#print axioms MatrixBounds.Tensor.CW.oneLetterRepresentativeZ
#print axioms MatrixBounds.Tensor.CW.one_letter_axis_card
#print axioms MatrixBounds.Tensor.CW.one_letter_exact_variable_card
#print axioms MatrixBounds.Tensor.CW.ySectorLabel
#print axioms MatrixBounds.Tensor.CW.zSectorLabel
#print axioms MatrixBounds.Tensor.CW.ySectorLabel_class
#print axioms MatrixBounds.Tensor.CW.zSectorLabel_class
#print axioms MatrixBounds.Tensor.CW.one_letter_pooled_entropy_zero
#print axioms MatrixBounds.Tensor.CW.one_letter_y_retention
#print axioms MatrixBounds.Tensor.CW.one_letter_z_retention
#print axioms MatrixBounds.Tensor.CW.one_letter_fine
#print axioms MatrixBounds.Tensor.CW.oneLetterProfile
#print axioms MatrixBounds.Tensor.CW.oneLetterLaw
#print axioms MatrixBounds.Tensor.CW.one_letter_hasType
#print axioms MatrixBounds.Tensor.CW.oneLetterVariableEquiv
#print axioms MatrixBounds.Tensor.CW.one_letter_activeWithin
#print axioms MatrixBounds.Tensor.CW.one_letter_window_identity
#print axioms MatrixBounds.Tensor.CW.contextReduction_one_letter_exact
#print axioms MatrixBounds.Tensor.CW.finOneUnit
#print axioms MatrixBounds.Tensor.CW.oneLetterFamilyNumbering
#print axioms MatrixBounds.Tensor.CW.oneLetterZeroZRestriction
#print axioms MatrixBounds.Tensor.CW.oneLetterZeroYRestriction
#print axioms MatrixBounds.Tensor.CW.oneLetterZeroXRestriction
#print axioms MatrixBounds.Tensor.CW.oneLetterRows
#print axioms MatrixBounds.Tensor.CW.oneLetterInner
#print axioms MatrixBounds.Tensor.CW.oneLetterColumns
#print axioms MatrixBounds.Tensor.CW.oneLetterMatrixRestriction
#print axioms MatrixBounds.Tensor.CW.oneLetterExactRestriction
#print axioms MatrixBounds.Tensor.CW.oneLetterExactFinRestriction
#print axioms MatrixBounds.Tensor.CW.oneLetterMatrixFinRestriction
#print axioms MatrixBounds.Tensor.CW.mixedOneLetterShape
#print axioms MatrixBounds.Tensor.CW.one_letter_matrix_volume
#print axioms MatrixBounds.Tensor.CW.mixedOneLetterShape_permute
#print axioms MatrixBounds.Tensor.CW.one_letter_matrix_volume_permute
#print axioms MatrixBounds.Tensor.CW.one_letter_childLaw
#print axioms MatrixBounds.Tensor.CW.one_letter_profile_support
#print axioms MatrixBounds.Tensor.CW.oneLetterWindowRestriction
#print axioms MatrixBounds.Tensor.CW.oneLetterWindowMatrixRestriction
#print axioms MatrixBounds.Tensor.CW.contextReduction_one_letter_window_matrix
#print axioms MatrixBounds.Tensor.CW.Pairing
#print axioms MatrixBounds.Tensor.CW.Pairing.left
#print axioms MatrixBounds.Tensor.CW.Pairing.right
#print axioms MatrixBounds.Tensor.CW.Pairing.axis
#print axioms MatrixBounds.Tensor.CW.pairing_product_identity
#print axioms MatrixBounds.Tensor.CW.pairedParents
#print axioms MatrixBounds.Tensor.CW.exactChildren
#print axioms MatrixBounds.Tensor.CW.Pairing.typedAxis
#print axioms MatrixBounds.Tensor.CW.paired_exact_identity
#print axioms MatrixBounds.Tensor.CW.pairedExactCertificate
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.child_profile_range
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.parent_weights_sum
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.parentCenter_range
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.exists_parent_entropy_control
#print axioms MatrixBounds.Tensor.CW.parentAxisChildren
#print axioms MatrixBounds.Tensor.CW.parentAxisChildren_fine
#print axioms MatrixBounds.Tensor.CW.childLabels_shape
#print axioms MatrixBounds.Tensor.CW.parent_children_nonzero
#print axioms MatrixBounds.Tensor.CW.parent_y_compatibility
#print axioms MatrixBounds.Tensor.CW.parent_z_compatibility
#print axioms MatrixBounds.Tensor.CW.fineWord_concatenate
#print axioms MatrixBounds.Tensor.CW.Pairing.fineAxis
#print axioms MatrixBounds.Tensor.CW.paired_fine_identity
#print axioms MatrixBounds.Tensor.CW.Pairing.accepts
#print axioms MatrixBounds.Tensor.CW.acceptedParents
#print axioms MatrixBounds.Tensor.CW.paired_accepted_identity
#print axioms MatrixBounds.Tensor.CW.pairedAcceptedCertificate
#print axioms MatrixBounds.Tensor.CW.coarse
#print axioms MatrixBounds.Tensor.CW.coarse_zero
#print axioms MatrixBounds.Tensor.CW.coarse_middle
#print axioms MatrixBounds.Tensor.CW.coarse_extreme
#print axioms MatrixBounds.Tensor.CW.coarse_eq_zero
#print axioms MatrixBounds.Tensor.CW.support_total
#print axioms MatrixBounds.Tensor.CW.wordCoarse
#print axioms MatrixBounds.Tensor.CW.word_support_coordinates
#print axioms MatrixBounds.Tensor.CW.word_support_total
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.permutedCoarse
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.permutedCoarseReference
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.permutedCoarse_symmetric
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.permutedLaw
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.permutedCoarse_parentLaw
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedParentTensor
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedMatrixTensor
#print axioms MatrixBounds.Tensor.CW.Terminal.eventual_permuted_terminal_extraction
#print axioms MatrixBounds.Tensor.CW.Terminal.fullCounts_marginal
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_edge_marginal
#print axioms MatrixBounds.Tensor.CW.Terminal.unpermutedEdgeWord
#print axioms MatrixBounds.Tensor.CW.Terminal.unpermuted_edge_coordinate
#print axioms MatrixBounds.Tensor.CW.Terminal.unpermuted_edge_marginal
#print axioms MatrixBounds.Tensor.CW.Terminal.unpermuted_edge_typed
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_all_edges_prescribed
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedPrescribedEquiv
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedCounts_mul
#print axioms MatrixBounds.Tensor.CW.oneLetterMarginalData
#print axioms MatrixBounds.Tensor.CW.oneLetterMarginalReference
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedCounts
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedData
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_counts_symmetric
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedReference
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedRepresentativeX
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedRepresentativeY
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedRepresentativeZ
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedRate
#print axioms MatrixBounds.Tensor.CW.Terminal.exists_uniform_permuted_rates
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedRetention
#print axioms MatrixBounds.Tensor.CW.Terminal.exists_permuted_terminal_extraction_window
#print axioms MatrixBounds.Tensor.CW.Terminal.coordinatePotential
#print axioms MatrixBounds.Tensor.CW.Terminal.coordinatePotential_positive
#print axioms MatrixBounds.Tensor.CW.Terminal.coordinatePotential_product
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedCounts_support
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedCounts_gibbs
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_coarseRetention_exact
#print axioms MatrixBounds.Tensor.CW.Terminal.axisLaw
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_center_x
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_center_y
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_center_z
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_parent_interface
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedParentTensor_eq_windowed
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_parentLaw
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_parent_law
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_parent_entropy
#print axioms MatrixBounds.Tensor.CW.OneLetterRowIndices
#print axioms MatrixBounds.Tensor.CW.OneLetterInnerIndices
#print axioms MatrixBounds.Tensor.CW.OneLetterColumnIndices
#print axioms MatrixBounds.Tensor.CW.oneLetterDataMatrixRestriction
#print axioms MatrixBounds.Tensor.CW.one_letter_product_volume
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedMatrixRestriction
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_matrix_volume
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_matrix_log_volume
#print axioms MatrixBounds.Tensor.CW.Terminal.contextReduction_permuted_terminal_matrix
#print axioms MatrixBounds.Tensor.CW.Terminal.PermutedMixedRows
#print axioms MatrixBounds.Tensor.CW.Terminal.PermutedMixedInner
#print axioms MatrixBounds.Tensor.CW.Terminal.PermutedMixedColumns
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedMixedMatrixRestriction
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_mixed_matrix_volume
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_mixed_matrix_log_volume
#print axioms MatrixBounds.Tensor.CW.Terminal.contextReduction_permuted_mixed_matrix
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_nominal_y_retention
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_nominal_z_retention
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_nominal_rates
#print axioms MatrixBounds.Tensor.CW.Terminal.axisEntropy_nonnegative
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedRetention_loss
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedRetention_nonnegative
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedRetention_lower
#print axioms MatrixBounds.Tensor.CW.Terminal.axisEntropy
#print axioms MatrixBounds.Tensor.CW.Terminal.coordinate_entropy
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_coarse_entropy
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_y_fine_retention
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_z_fine_retention
#print axioms MatrixBounds.Tensor.CW.Terminal.permuted_coarse_degree_rate
#print axioms MatrixBounds.Tensor.CW.oneLetterWindowTarget
#print axioms MatrixBounds.Tensor.CW.oneLetterWindowTargetRestriction
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedApproximateTarget
#print axioms MatrixBounds.Tensor.CW.Terminal.permutedApproximateMatrixRestriction
#print axioms MatrixBounds.Tensor.CW.Terminal.contextReduction_permuted_approximate_matrix
#print axioms MatrixBounds.Tensor.CW.sourceWindowFamily
#print axioms MatrixBounds.Tensor.CW.physicalWindowFamily
#print axioms MatrixBounds.Tensor.CW.physicalWindowFamilyRestriction
#print axioms MatrixBounds.Tensor.CW.physicalWindowFamilyInverseRestriction
#print axioms MatrixBounds.Tensor.CW.physicalWindowInverseRestriction
#print axioms MatrixBounds.Tensor.CW.physicalWindowRestriction
#print axioms MatrixBounds.Tensor.CW.fineHalves
#print axioms MatrixBounds.Tensor.CW.CompatibilityClass
#print axioms MatrixBounds.Tensor.CW.yClass
#print axioms MatrixBounds.Tensor.CW.zClass
#print axioms MatrixBounds.Tensor.CW.childLabels
#print axioms MatrixBounds.Tensor.CW.pooledCompatible
#print axioms MatrixBounds.Tensor.CW.fineHalves_reorder
#print axioms MatrixBounds.Tensor.CW.childLabels_reorder
#print axioms MatrixBounds.Tensor.CW.pooledCompatible_reorder
#print axioms MatrixBounds.Tensor.CW.pooledCompatible_card
#print axioms MatrixBounds.Tensor.CW.coarseAgreement
#print axioms MatrixBounds.Tensor.CW.coarseAgreement_reorder
#print axioms MatrixBounds.Tensor.CW.compatibleFine
#print axioms MatrixBounds.Tensor.CW.compatibleFine_reorder
#print axioms MatrixBounds.Tensor.CW.compatibleFine_row_bound
#print axioms MatrixBounds.Tensor.CW.compatibleFine_degree_bound
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.PrescribedEdges
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.word_injective
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.prescribedWord
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.prescribedWord_injective
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.prescribedWord_surjective
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.prescribedWordEquiv
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.prescribed_card
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.prescribed_support
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.prescribed_compatible_degree_le
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.childLaw
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.parentLaw
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.pooledLaw
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.parentCenter_childLaw
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.child_count_le
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.childLaw_weighted
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.pooledLaw_childLaw
#print axioms MatrixBounds.Tensor.CW.Mixed.RationalStage.eventual_labelled_canonical_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.RationalStage.PhysicalPresentation.originalParent
#print axioms MatrixBounds.Tensor.CW.Mixed.RationalStage.PhysicalPresentation.originalChildren
#print axioms MatrixBounds.Tensor.CW.Mixed.RationalStage.eventual_canonical_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.rationalChildren
#print axioms MatrixBounds.Tensor.CW.Mixed.rationalChildrenRestriction
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.fromRational
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.fromRational_reference
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.fromRational_probability
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.rationalProfile_marginal
#print axioms MatrixBounds.Tensor.CW.SplitRestrictionData.fromRational_parentLaw
#print axioms MatrixBounds.Numeric.TypedProbabilityRow.rational_range
#print axioms MatrixBounds.Numeric.TypedProbabilityRow.real_range
#print axioms MatrixBounds.Numeric.TypedProbabilityRow.real_total
#print axioms MatrixBounds.Entropy.OrbitMap.decode_unit_range
#print axioms MatrixBounds.Entropy.OrbitMap.decode_supplied_range
#print axioms MatrixBounds.Tensor.CW.RationalSplit.parentLaw_range
#print axioms MatrixBounds.supplied_mixture_range
#print axioms MatrixBounds.Tensor.CW.Mixed.eventual_rational_extraction
#print axioms MatrixBounds.Tensor.CW.Mixed.RationalPositions
#print axioms MatrixBounds.Tensor.CW.Mixed.rationalData
#print axioms MatrixBounds.Tensor.CW.Mixed.rationalRetention
#print axioms MatrixBounds.Tensor.CW.Mixed.rationalData_nominalRetention
#print axioms MatrixBounds.Tensor.CW.Mixed.rationalRetention_error
#print axioms MatrixBounds.Tensor.CW.Mixed.rationalParent
#print axioms MatrixBounds.Tensor.CW.Mixed.rationalData_parent
#print axioms MatrixBounds.Tensor.CW.RationalSplit.orbitParentValue
#print axioms MatrixBounds.Tensor.CW.RationalSplit.parentLaw_orbitValue
#print axioms MatrixBounds.Tensor.CW.RationalSplit.orbitParentValue_symmetric
#print axioms MatrixBounds.Tensor.CW.RationalSplit.orbitParentMass
#print axioms MatrixBounds.Tensor.CW.RationalSplit.parentLaw_decode
#print axioms MatrixBounds.Tensor.CW.RationalSplit.orbitParentMass_formula
#print axioms MatrixBounds.Tensor.CW.RationalSplit.parentLaw_orbit_entropy
#print axioms MatrixBounds.Tensor.CW.RationalSplit.orbitPooledMass
#print axioms MatrixBounds.Tensor.CW.RationalSplit.pooledLaw_decode
#print axioms MatrixBounds.Tensor.CW.RationalSplit.orbitFineRetention
#print axioms MatrixBounds.Tensor.CW.RationalSplit.fineRetention_orbits
#print axioms MatrixBounds.Tensor.CW.Mixed.roleChildEquiv
#print axioms MatrixBounds.Tensor.CW.Mixed.role_childWeight
