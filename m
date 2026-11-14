Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.75.76.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647365;
	b=MYbDdk9IvjhlW1i3WU9qfvracY0hHHO+6XsTpKmpS64fIm8kaB5v0PniCOgxGdVLO6ww
	 fZdxvSw5//T5G9a/8gP7Dnl1OEM9uphffdClgzeBDx6M9oq/oJ/znw9hSSrYDx9+B6XKn
	 /FhPfm1IHdxroSyz00Y8G+8XquRZYciIGDEAR+v9xe4MISMOo7blgJGF4drG75nvuSJol
	 QjQz1VsR8htHJAs1aEYtA3WgK08dlBjm99TcaL+ORnJrxnXjFQbgDlLiQK62Qt4NEq5E4
	 MYUoK2YBDAmR6o+4WWk+YlEfW/YjuvSs0g4ZqW0Fc0Oxnbz/pQzEv/9nDMo4UjEGPhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FOVWd2qsqafgx33bmFPWbdLfTArZG1j+JJ1xA6ovljI=;
	b=ybGoB9dk9HJXoeZXywHVWeu1Za2dgS1m5Do5isR2ZxJYWPe9sO9KjMl80R9jU/Aar2zJ
	 SWn7g36ARFx8TylKur65Ms+XiHPdhPQeXHsp5NR1T/kvRtNwsoyBsyhL4lnBchyVeiXoj
	 WX0woAmcmppLW3le7fwCd+6mLUeQ+BZyTBFLXNtcVffZE2K85KB2ki6PnJC1/9AS4nwgF
	 ryXkQ3hXWl9patPRL7BDw1o0nS3eQiYsaseN7QglvgSeJCzpNWtg1oLnyeOnm7LMvUPr2
	 t81b6TjAJwt04vIdAaKJ4O0pEL5B3UjeilFLeKvql5lrzArsr9Z67QPquw5MSGBruEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=email.cz;
	spf=pass smtp.mailfrom=email.cz;
	dkim=pass header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=YOTGuZOl;
	arc=none smtp.remote-ip=77.75.76.210
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDA2606A334
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 09:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFDA2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=YOTGuZOl
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-chpkt
	(smtpc-mxd-5f46658f7f-chpkt [2a02:598:128:8a00::1000:a3b])
	id 36bee7bac84a5510363069a2;
	Sat, 14 Nov 2026 10:08:04 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647285; bh=FOVWd2qsqafgx33bmFPWbdLfTArZG1j+JJ1xA6ovljI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=YOTGuZOl9lgS4eYflV3MmKC7Hw3U2bX0BKbd9Jl6Clsa9eHJsFwGpHCSpZPiqAOXW
	 CyMjb5M/lbpr3mMmjJxNairrShz7gTyTBNVPb5WenugB+YFRWrn7tVixakpLX6CuqV
	 J+3eiAV7mnLgyeGJ9wEHa8CU5NtDtq0rphZAGRTE+P02GhP5yvOcV8hUlkxxn+VG3p
	 bwqjgVjMsfO95CME30fN01GKqgTD8MIuf11rkx9e2oxFqUNgz3M5pxF7TKccgYCWU2
	 Vhlyjs60zkwgbOij3BtYmZ1Hu1r6Hjgz106vWRp0V5BDicka0CYttOs9sfNej5fPka
	 dV21pworDaxHw==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id d66854cc-2367-4c3f-9226-e4ac87f5aff1;
	Sat, 14 Nov 2026 10:08:03 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 4/6] wifi: ath10k: usb: add hw_params for Atheros QCA9377-7
Date: Sat, 14 Nov 2026 10:07:35 +0100
Message-ID: <20261114090737.64348-5-tomaspaukrt@email.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114090737.64348-1-tomaspaukrt@email.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hw_params for modules based on Atheros QCA9377-7 chipset like
8devices BLUE bean or SparkLAN WUBQ-159ACN.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/core.c | 42 ++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 0741b7ee073c..b7a84980a088 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -628,6 +628,48 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.delay_unmap_buffer = false,
 		.mcast_frame_registration = false,
 	},
+	{
+		.id = QCA9377_HW_1_1_DEV_VERSION,
+		.dev_id = 0x9378,
+		.bus = ATH10K_BUS_USB,
+		.name = "qca9377 hw1.1 usb",
+		.patch_load_addr = QCA9377_HW_1_0_PATCH_LOAD_ADDR,
+		.uart_pin = 6,
+		.otp_exe_param = 0,
+		.channel_counters_freq_hz = 88000,
+		.max_probe_resp_desc_thres = 0,
+		.cal_data_len = 8124,
+		.fw = {
+			.dir = QCA9377_HW_1_0_FW_DIR,
+			.board_size = QCA9377_BOARD_DATA_SZ,
+			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
+		},
+		.rx_desc_ops = &qca988x_rx_desc_ops,
+		.hw_ops = &qca6174_ops,
+		.hw_clk = qca6174_clk,
+		.target_cpu_freq = 176000000,
+		.decap_align_bytes = 4,
+		.spectral_bin_discard = 0,
+		.spectral_bin_offset = 0,
+		.vht160_mcs_rx_highest = 0,
+		.vht160_mcs_tx_highest = 0,
+		.n_cipher_suites = 8,
+		.ast_skid_limit = 0x10,
+		.num_wds_entries = 0x20,
+		.target_64bit = false,
+		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
+		.shadow_reg_support = false,
+		.rri_on_ddr = false,
+		.hw_filter_reset_required = true,
+		.fw_diag_ce_download = false,
+		.credit_size_workaround = false,
+		.tx_stats_over_pktlog = false,
+		.dynamic_sar_support = false,
+		.hw_restart_disconnect = false,
+		.use_fw_tx_credits = true,
+		.delay_unmap_buffer = false,
+		.mcast_frame_registration = false,
+	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
 		.dev_id = QCA9377_1_0_DEVICE_ID,
-- 
2.43.0

