package com.mime.qweibo.examples;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import javax.swing.DropMode;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.SwingUtilities;
import javax.swing.TransferHandler;
import javax.swing.table.JTableHeader;
import javax.swing.text.BadLocationException;
import javax.swing.text.Document;

import com.mime.qweibo.OauthKey;
import com.mime.qweibo.QAsyncHandler;
import com.mime.qweibo.QParameter;
import com.mime.qweibo.QWeiboRequest;

public class QWeiboUIMain {

	private static JFrame mFrame;
	private static Container mContainer;
	private static String mAppKey;
	private static String mAppSecret;
	private static String mTokenKey;
	private static String mTokenSecret;
	private static String mVerify;
	private static String mError;
	/** Initial page. Input your App Key and App Secret*/
	private static final int OPTION_INIT = 1;
	/** GUI to input your verifier (from browser) */
	private static final int OPTION_VERIFY = 2;
	private static final int OPTION_MAIN = 3;
	private static final int OPTION_ERROR = 4;

	private static String APP_FILE = "qweibo_config.properties";

	private static final String KEY_APP_KEY = "app_key";
	private static final String KEY_APP_SECRET = "app_secret";
	private static final String KEY_TOKEN_KEY = "token_key";
	private static final String KEY_TOKEN_SECRET = "token_secret";

	private static Properties mConfig = new Properties();

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		mFrame = new JFrame();
		mFrame.setTitle("QWeibo SDK Samples");
		mFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		mContainer = mFrame.getContentPane();
		mContainer.setLayout(null);
		initKeys();
		setUpUI(OPTION_INIT);
	}

	private static void initKeys() {

		File propFile = new File(APP_FILE);
		if (propFile.exists()) {
			InputStream is = null;
			try {
				is = new FileInputStream(propFile);
				mConfig.loadFromXML(is);
				mAppKey = mConfig.getProperty(KEY_APP_KEY);
				mAppSecret = mConfig.getProperty(KEY_APP_SECRET);
				mTokenKey = mConfig.getProperty(KEY_TOKEN_KEY);
				mTokenSecret = mConfig.getProperty(KEY_TOKEN_SECRET);
			} catch (InvalidPropertiesFormatException e) {
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		} else {
			mAppKey = "";
			mAppSecret = "";
			mTokenKey = "";
			mTokenSecret = "";
		}
		mVerify = "";
		System.out.println(mAppKey);
	}

	private static void setUpUI(int option) {
		switch (option) {
		case OPTION_INIT:
			mFrame.setResizable(false);
			mFrame.setBounds(200, 100, 480, 240);

			JLabel labelAppKey = new JLabel("AppKey:");
			labelAppKey.setBounds(10, 10, 80, 30);
			mContainer.add(labelAppKey);

			final JTextField txtAppKey = new JTextField();
			txtAppKey.setBounds(90, 10, 320, 30);
			txtAppKey.setText(mAppKey);
			mContainer.add(txtAppKey);

			JLabel labelAppSecret = new JLabel("AppSecret:");
			labelAppSecret.setBounds(10, 50, 80, 30);
			mContainer.add(labelAppSecret);

			final JPasswordField txtAppSecret = new JPasswordField();
			txtAppSecret.setBounds(90, 50, 320, 30);
			txtAppSecret.setText(mAppSecret);
			txtAppSecret.setEchoChar('*');
			mContainer.add(txtAppSecret);

			final JButton okBtn = new JButton("Continue");
			okBtn.setBounds(100, 100, 300, 40);
			okBtn.addActionListener(new ActionListener() {

				public void actionPerformed(ActionEvent arg0) {
					String appKey = txtAppKey.getText();
					boolean changed = false;
					if (!appKey.equals(mAppKey)) {
						mAppKey = appKey;
						changed = true;
					}
					String appSecret = new String(txtAppSecret.getPassword());
					if (!appSecret.equals(mAppSecret)) {
						mAppSecret = appSecret;
						changed = true;
					}

					if (isNullOrEmpty(mAppKey) || isNullOrEmpty(mAppSecret)) {
						return;
					}
					if (changed) {
						mTokenKey = "";
						mTokenSecret = "";
					}
					if (isNullOrEmpty(mTokenKey) || isNullOrEmpty(mTokenSecret)) {
						String resStr = null;
						QWeiboSyncApi api = new QWeiboSyncApi();
						resStr = api.getRequestToken(mAppKey, mAppSecret,null);
						if (parseToken(resStr)) {
							setUpUI(OPTION_VERIFY);
							// request verify code
							requestVerify();
						} else {
							mError = "Can't parse request token string!~\nTry again later!";
							setUpUI(OPTION_ERROR);
						}
					} else {
						setUpUI(OPTION_MAIN);
					}
				}
			});
			mContainer.add(okBtn);

			break;
		case OPTION_VERIFY:
			mFrame.setVisible(false);
			mContainer.removeAll();

			JLabel labelVerify = new JLabel(
					"Input the oauth_verifier obtained from your broswer's address bar:");
			labelVerify.setBounds(10, 20, 400, 30);
			mContainer.add(labelVerify);

			final JTextField txtVerify = new JTextField();
			txtVerify.setBounds(10, 50, 430, 30);
			txtVerify.setText(mVerify);
			mContainer.add(txtVerify);

			final JButton okVerifyBtn = new JButton("Continue");
			okVerifyBtn.setBounds(100, 100, 300, 40);
			okVerifyBtn.addActionListener(new ActionListener() {

				public void actionPerformed(ActionEvent arg0) {
					mVerify = txtVerify.getText();
					String resStr = null;
					QWeiboSyncApi api = new QWeiboSyncApi();
					resStr = api.getAccessToken(mAppKey, mAppSecret, mTokenKey,
							mTokenSecret, mVerify);
					System.out.println(resStr);
					if (parseToken(resStr)) {
						saveProperties();
						setUpUI(OPTION_MAIN);
					} else {
						mError = "Can't parse access token string!~\nTry again later!";
						setUpUI(OPTION_ERROR);
					}
				}

			});
			mContainer.add(okVerifyBtn);

			break;
		case OPTION_ERROR:
			mFrame.setVisible(false);
			mContainer.removeAll();

			final JTextPane errorPane = new JTextPane();
			errorPane.setBounds(20, 10, 400, 180);
			errorPane.setText(mError);
			mContainer.add(errorPane);

			break;
		case OPTION_MAIN:
			mFrame.setVisible(false);
			mContainer.removeAll();
			mFrame.setSize(820, 620);

			// response panel
			final JTextPane response = new JTextPane();
			JScrollPane jsp = new JScrollPane(response);
			jsp.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
			jsp.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);

			JPanel panelResopnse = new JPanel();
			panelResopnse.setLayout(new BorderLayout());
			panelResopnse.setBorder(new javax.swing.border.TitledBorder(null,
					"Response",
					javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION,
					javax.swing.border.TitledBorder.DEFAULT_POSITION,
					new java.awt.Font("Tahoma", 1, 16), new java.awt.Color(0,
							102, 102)));
			panelResopnse.add(jsp);
			panelResopnse.setBounds(400, 10, 400, 580);
			mContainer.add(panelResopnse);

			// URL panel
			JPanel urlPanel = new JPanel();
			urlPanel.setLayout(new BorderLayout());
			urlPanel.setBounds(10, 10, 380, 50);
			urlPanel.setBorder(new javax.swing.border.TitledBorder(null, "URL",
					javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION,
					javax.swing.border.TitledBorder.DEFAULT_POSITION,
					new java.awt.Font("Tahoma", 1, 13), new java.awt.Color(0,
							102, 102)));
			final JTextField urlText = new JTextField();
			urlPanel.add(urlText);
			mContainer.add(urlPanel);

			// query parameters panel
			final int paramSize = 12;
			JPanel queryPanel = new JPanel();
			queryPanel.setLayout(new BorderLayout());
			queryPanel.setBounds(10, 105, 380, 280);
			queryPanel.setBorder(new javax.swing.border.TitledBorder(null,
					"Query Parameters",
					javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION,
					javax.swing.border.TitledBorder.DEFAULT_POSITION,
					new java.awt.Font("Tahoma", 1, 13), new java.awt.Color(0,
							102, 102)));
			final JTable paramTable = new JTable(paramSize, 2);
			paramTable.setRowHeight(20);
			paramTable.addMouseListener(new MouseAdapter() {

				@Override
				public void mouseClicked(MouseEvent arg0) {
					if (SwingUtilities.isRightMouseButton(arg0)) {
						int row = paramTable.getSelectedRow();
						paramTable.getModel().setValueAt("", row, 0);
						paramTable.getModel().setValueAt("", row, 1);
					}
					super.mouseClicked(arg0);
				}

			});
			final JTableHeader paramHeader = paramTable.getTableHeader();
			paramHeader.getColumnModel().getColumn(0).setHeaderValue("name");
			paramHeader.getColumnModel().getColumn(1).setHeaderValue("value");
			JScrollPane paramJsp = new JScrollPane(paramTable);
			queryPanel.add(paramJsp);
			mContainer.add(queryPanel);

			// files panel
			final int filesSize = 8;
			JPanel filesPanel = new JPanel();
			filesPanel.setLayout(new BorderLayout());
			filesPanel.setBounds(10, 390, 380, 200);
			filesPanel.setBorder(new javax.swing.border.TitledBorder(null,
					"Image File Path",
					javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION,
					javax.swing.border.TitledBorder.DEFAULT_POSITION,
					new java.awt.Font("Tahoma", 1, 13), new java.awt.Color(0,
							102, 102)));
			final JTable fileTable = new JTable(filesSize, 1);
			fileTable.setRowHeight(20);
			fileTable.setDropMode(DropMode.ON_OR_INSERT_ROWS);
			fileTable.setTransferHandler(new TransferHandler() {
				private static final long serialVersionUID = -4334969061812563216L;

				public boolean canImport(TransferSupport support) {
					if (!support.isDrop()) {
						return false;
					}
					if (support.isDataFlavorSupported(DataFlavor.imageFlavor)
							|| support
									.isDataFlavorSupported(DataFlavor.javaFileListFlavor)) {
						return true;
					}
					return false;
				}

				public boolean importData(TransferSupport support) {
					// if we can't handle the import, say so
					if (!canImport(support)) {
						return false;
					}
					Transferable transferable = support.getTransferable();
					List<DataFlavor> flavors = Arrays.asList(transferable
							.getTransferDataFlavors());
					if (flavors.contains(DataFlavor.javaFileListFlavor)) {
						List<File> fileList = null;
						try {
							fileList = (List<File>) transferable
									.getTransferData(DataFlavor.javaFileListFlavor);
						} catch (UnsupportedFlavorException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						if (fileList != null && fileList.size() > 0) {
							String path = fileList.get(0).getAbsolutePath();
							JTable.DropLocation dl = (JTable.DropLocation) support
									.getDropLocation();
							int row = dl.getRow();
							fileTable.getModel().setValueAt(path, row, 0);
						}
					}
					return true;
				}
			});
			fileTable.addMouseListener(new MouseAdapter() {

				@Override
				public void mouseClicked(MouseEvent arg0) {
					if (SwingUtilities.isRightMouseButton(arg0)) {
						int row = fileTable.getSelectedRow();
						fileTable.getModel().setValueAt("", row, 0);
					}
					super.mouseClicked(arg0);
				}

			});
			final JTableHeader fileHeader = fileTable.getTableHeader();
			fileHeader.getColumnModel().getColumn(0).setHeaderValue("Images");
			JScrollPane fileJsp = new JScrollPane(fileTable);
			filesPanel.add(fileJsp);
			mContainer.add(filesPanel);

			// Button panel
			JPanel btnPanel = new JPanel();
			btnPanel.setLayout(new BorderLayout());
			btnPanel.setBounds(12, 70, 380, 30);
			final JComboBox methodComboBox = new JComboBox();
			methodComboBox.addItem("GET");
			methodComboBox.addItem("POST");
			JButton sendBtn = new JButton("Commit");
			sendBtn.addActionListener(new ActionListener() {

				public void actionPerformed(ActionEvent arg0) {
					String requestUrl = urlText.getText();
					List<QParameter> params = new ArrayList<QParameter>(
							paramSize);
					List<QParameter> files = new ArrayList<QParameter>(
							filesSize);
					for (int i = 0; i < paramSize; i++) {
						String name = (String) paramTable.getModel()
								.getValueAt(i, 0);
						String value = (String) paramTable.getModel()
								.getValueAt(i, 1);
						if (isNullOrEmpty(name) || isNullOrEmpty(value)) {
							continue;
						}
						QParameter param = new QParameter(name, value);
						if (!params.contains(param)) {
							params.add(param);
						}
					}
					for (int i = 0; i < filesSize; ++i) {
						String path = (String) fileTable.getModel().getValueAt(
								i, 0);
						if (isNullOrEmpty(path))
							continue;
						if (!files.contains(path))
							files.add(new QParameter("pic", path));
					}
					String method = (String) methodComboBox.getSelectedItem();

					OauthKey authKey = new OauthKey();
					authKey.customKey = mAppKey;
					authKey.customSecrect = mAppSecret;
					authKey.tokenKey = mTokenKey;
					authKey.tokenSecrect = mTokenSecret;

					QWeiboRequest request = new QWeiboRequest();
					request.asyncRequest(requestUrl, method, authKey, params,
							files, new QAsyncHandler() {
								String mContent = "";

								public void onThrowable(Throwable t,
										Object cookie) {
									mContent = "Request throw exception:"
											+ t.getLocalizedMessage();
									update();
								}

								private void update() {
									SwingUtilities.invokeLater(new Runnable() {
										
										public void run() {
											Document doc = response.getDocument();
											try {
												doc.insertString(
														doc.getLength(),
														mContent
																+ "\n------Wonderful Divider------\n",
														null);
											} catch (BadLocationException e) {
												e.printStackTrace();
											}
											response.setCaretPosition(doc.getLength());
										}
									});
									
								}

								public void onCompleted(int statusCode,
										String content, Object cookie) {
									mContent = content;
									update();
								}
							}, null);

				}
			});
			btnPanel.add(methodComboBox, BorderLayout.WEST);
			btnPanel.add(sendBtn, BorderLayout.EAST);
			mContainer.add(btnPanel);

			break;
		}

		mFrame.setVisible(true);
	}

	protected static void requestVerify() {
		if (!java.awt.Desktop.isDesktopSupported()) {

			System.err.println("Desktop is not supported (fatal)");
			// System.exit( 1 );
		}
		java.awt.Desktop desktop = java.awt.Desktop.getDesktop();
		if (desktop == null
				|| !desktop.isSupported(java.awt.Desktop.Action.BROWSE)) {

			System.err
					.println("Desktop doesn't support the browse action (fatal)");
			// System.exit( 1 );
		}
		try {
			desktop.browse(new URI(
					"http://open.t.qq.com/cgi-bin/authorize?oauth_token="
							+ mTokenKey));
		} catch (IOException e) {
			e.printStackTrace();
			// System.exit( 1 );
		} catch (URISyntaxException e) {
			e.printStackTrace();
			// System.exit( 1 );
		}
	}

	protected static void saveProperties() {
		File file = new File(APP_FILE);
		try {
			if (file.exists())
				file.delete();
			if (file.createNewFile()) {
				mConfig.setProperty(KEY_APP_KEY, mAppKey);
				mConfig.setProperty(KEY_APP_SECRET, mAppSecret);
				mConfig.setProperty(KEY_TOKEN_KEY, mTokenKey);
				mConfig.setProperty(KEY_TOKEN_SECRET, mTokenSecret);
				OutputStream os = new FileOutputStream(file);
				mConfig.storeToXML(os, "QWeibo");
				os.flush();
				os.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static boolean isNullOrEmpty(String str) {
		if (str == null || "".equals(str.trim()))
			return true;
		return false;
	}

	static boolean parseToken(String response) {
		if (response == null || response.equals("")) {
			return false;
		}

		String[] tokenArray = response.split("&");

		if (tokenArray.length < 2) {
			return false;
		}

		String strTokenKey = tokenArray[0];
		String strTokenSecrect = tokenArray[1];

		String[] token1 = strTokenKey.split("=");
		if (token1.length < 2) {
			return false;
		}
		mTokenKey = token1[1];

		String[] token2 = strTokenSecrect.split("=");
		if (token2.length < 2) {
			return false;
		}
		mTokenSecret = token2[1];

		return true;
	}

}
