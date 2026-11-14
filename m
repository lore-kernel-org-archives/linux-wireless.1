Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.75.76.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647364;
	b=rCEWUN/v1hkWAOiFhVRnFkdbC1TF9UpbsVzyu6wzS1SfBvmNP65XVqzgnLwF/xF+sS/w
	 RuPIxF8DnD/GR35lxz55fKQ3dhXMNyoBT2H17r6UNZUHkdJciDBiP5qYL9m4CI68YMwvV
	 Onhonz2DbiDMcnpZ89cnrHNOCr6F+0+GMZ/iOCciTs0DXD1dq8jchdp6t7aBKQ8XrgxoW
	 cac+H6ZzHQjoSkugFjzX4VxcxF/oIS1s7ppCScgXP2/vbGL111YDbMb7HFBi0T0fCfzmr
	 Qh1IcRsMaMRIBsd4wGdzmVfXnbG+MARHUhq7KTexhdHqPt4aTtnXNQChvvSf5V6RdWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=anje5GejJtLtZ1LMkkzc7qlhnpiQcRzBHHKiUI0vF2Q=;
	b=XTBelxAAw5NITTA+nMqzxoYb/Fy9xdPZgrVdVix2k2NGpUJ45dFzAfq1Hr3bbRdQpLg+
	 Bjcsw963lFFDaigmBbmU/RQiIZ3yJJTInAdrGBjTmNEoIMPY6Y0Nyroc/J2gIdSXP3v1E
	 dnNYDA9OvNcx2VnXuTb8GWkNZ84HLDvHFOrGfldSZfIgUYOsMKon/AoXVGpz6crxCfMmV
	 HGJ8VYgJck1axDVWx82GKCk03kqkiGmnMfepYxMsYZyY8pEiXEeY57BtTKGG8O4ifE2UD
	 b1S+KszvsO0ZNVRD3x+K7k1Ynv1ktno3229T5s7QJGGE307P4sefq9ubpDJNKAayM+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=email.cz;
	spf=pass smtp.mailfrom=email.cz;
	dkim=pass header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=xE26i8pv;
	arc=none smtp.remote-ip=77.75.76.210
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B850606A338
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 09:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B850606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=xE26i8pv
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-chpkt
	(smtpc-mxd-5f46658f7f-chpkt [2a02:598:128:8a00::1000:a3b])
	id 10f87fa5ee0ccd0f1076f1bd;
	Sat, 14 Nov 2026 10:08:31 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647311; bh=anje5GejJtLtZ1LMkkzc7qlhnpiQcRzBHHKiUI0vF2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=xE26i8pv82TFGDN8R1lbXP0YnH15bbpbAfOu+PhXWz85wWTG2KThXlF0Yc7CeHv9b
	 Pw04wY0a3Kd8tbz0BuekyTy4IvVPueYTqOcxbHpsq56xGYua9k0RoUchDm9TgtjC5g
	 c9/A2tmmBKG8wSMzXckDyvcJjYufzY1wE3+njqGb4qHA8sNTxMS0nDB1rfS7JiC++L
	 j6m+7RxfMpDhdxw6VWZXYRboMWbCbZnt5sX1GjOZUybpZztiQmKsZzQGdA2jSC5Zi8
	 a5mRKaGuuO6JuS66dGdOgS0DS44l9pcC+io7mipUPJ1tYG+M8wTCMO035wkSrqKIPO
	 kNoJWSpCr3w0g==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id d343ba92-2c4a-413e-8de5-ff77269ccd45;
	Sat, 14 Nov 2026 10:08:02 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 1/6] wifi: ath10k: usb: fix group key installation
Date: Sat, 14 Nov 2026 10:07:32 +0100
Message-ID: <20261114090737.64348-2-tomaspaukrt@email.cz>
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

ath10k_install_key() waits for install_key_done, which is completed by
the HTT security indication. The firmware of QCA9377 USB devices sends
this indication for pairwise keys only, so the installation of a group
key times out after 3 seconds and a station cannot connect to a
protected network:

  usb 1-1.1: failed to install key for vdev 0 peer c4:93:00:3b:6c:f9: -110
  wlan0: failed to set key (2, ff:ff:ff:ff:ff:ff) to hardware (-110)

The firmware does send WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID for every
key, so complete the key installation on this event for USB devices.
The other buses are not changed.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index e57588c19c80..7d43a23017aa 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5339,6 +5339,10 @@ void ath10k_wmi_event_vdev_install_key_complete(struct ath10k *ar,
 						struct sk_buff *skb)
 {
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID\n");
+
+	/* the USB firmware sends no HTT security indication for group keys */
+	if (ar->hif.bus == ATH10K_BUS_USB)
+		complete(&ar->install_key_done);
 }
 
 void ath10k_wmi_event_inst_rssi_stats(struct ath10k *ar, struct sk_buff *skb)
-- 
2.43.0

