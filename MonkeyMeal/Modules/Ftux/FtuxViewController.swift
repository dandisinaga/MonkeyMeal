//
//  FtuxViewController.swift
//  MonkeyMeal
//
//  Created by Mochamad Dandi on 07/06/22.
//

import UIKit

class FtuxViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    let viewModel = FtuxViewModel()
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        observeError()
        observeCurrentIndex()
        viewModel.loadFtuxes()
    }
// MARK: - observeError
    func observeError() {
        viewModel.error.bind { [weak self] (error) in
            let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
    }
// MARK: - observeCurrentIndex
    func observeCurrentIndex() {
        viewModel.currentIndex.bind { [weak self] (index) in
            guard let `self` = self else { return }
            switch index {
            case -1:
                // show empty UI
                break
            case self.viewModel.numberOfItems:
                self.showLoginLandingViewController()
            default:
                if index == 0 {
                    self.collectionView.reloadData()
                }
                self.goToPage(index)
            }
        }
    }
}
// MARK: - Helpers
extension FtuxViewController {
    func setup() {
        nextButton.layer.cornerRadius = 28
        nextButton.layer.masksToBounds = true
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func goToPage(_ page: Int) {
        collectionView.scrollToItem(at: IndexPath(item: page, section: 0), at: .centeredHorizontally, animated: true)
        updatePage(page)
    }
    
    func updatePage(_ page: Int) {
        pageControl.currentPage = page
        nextButton.setTitle(viewModel.buttonTitleAtIndex(page), for: UIControl.State.normal)
    }
}
// MARK: - Actions
extension FtuxViewController {
    @IBAction func nextButtonTapped(_ sender: Any) {
        let toPage = min(viewModel.numberOfItems, pageControl.currentPage + 1)
//        if toPage != pageControl.currentPage {
//        goToPage(toPage)
//        }
        viewModel.currentIndex.value = toPage
    }
}
// MARK: - UICollectionViewDataSource
extension FtuxViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ftuxCellId", for: indexPath) as! FtuxViewCell
        
        cell.imageView.image = viewModel.imageAtIndex(indexPath.item)
        cell.titleLabel.text = viewModel.titleAtIndex(indexPath.item)
        cell.subtitleLabel.text = viewModel.subtitleAtIndex(indexPath.item)
        
        return cell
    }
}
// MARK: - UICollectionViewDelegate
extension FtuxViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        updatePage(page)
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension FtuxViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
