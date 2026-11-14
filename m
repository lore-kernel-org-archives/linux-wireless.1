Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.75.76.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647337;
	b=pc43FtAEo8dGUY5/xRMEPpHWhaDiAHxDhVRECQxKt+GhAeS+l1Qxg3ltC0AGQM/qnrE0
	 Ecv8AUubPq6WO/6Fy9BxyKwMeU+xjg97lVr4L2BsEImRtvX5cAFBV0p1YuT3EXYL97lZy
	 0uL512EeYIWNANWTCVD6a70QwiWHrgxHjV4nkSuC5t+khmEJLFL6gnwo7RZsMDA+u2ZGL
	 cjfT0hdr+eDYUuly70aFX9QQuKBMXRUQtTz1k5c2j35iIQh02xQ19hoC9YRLP/Y/tkfkt
	 9Fkv3CRcsKYaIPV2OmTI/VXAXzqtK9UjPsBsiNIwckdb5Tmr/yWpI4oIc0hfO4C29fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=08dAqwjFraSeFcB1P1Hmj/Co5aFihYuNoiPOZEEnkkc=;
	b=z6E1h78d3W0nW6RTNgCt/SfUPzgM2lPOsEP1IRNy2Vc9zwfNx3npC5/X5OV7OIWhz5x/
	 fnXp2LgmdrYOxzXz49sXn/unSFIpb+FV+745kRbSRHFdIRiOli5w0qegh9eQmvkYO3udy
	 VuO/+spa0EGn2rkcLe/OzafuGe5UvJnN0W7MxD79Odi7ahW3qlwNylkqODpMuExO1Ce5R
	 HsBnFaZFOSUiL86I5LtdlbaZiU86OiUMkPx3oxrEgQ9jkJrpPH7V9QPAe/I7Z7YKno5mi
	 NVZ/yf4rTqPE4Kj51pF5p6ueAMniIXUuw13fyBGE9Ky7d3I0Op5asy+0up2gtMqXZVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=email.cz;
	spf=pass smtp.mailfrom=email.cz;
	dkim=pass header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=zcou6bBc;
	arc=none smtp.remote-ip=77.75.76.210
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA98606A327
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 09:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA98606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=zcou6bBc
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-chpkt
	(smtpc-mxd-5f46658f7f-chpkt [2a02:598:128:8a00::1000:a3b])
	id 5da1f9f7a3554b5d5d2f77ef;
	Sat, 14 Nov 2026 10:08:09 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647289; bh=08dAqwjFraSeFcB1P1Hmj/Co5aFihYuNoiPOZEEnkkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=zcou6bBczVHObU2qvRSvf+XiLYt9iMIBSytC5iWCeejqlPsa8LU+L/v6MCPiyzKBJ
	 VKPP4iHvWatblFfv+Mgi2C4NlyXt+qx3oO5wgJa/H4alqHbsJBi1Cv2f53bRBsgHxh
	 1huqCPks3pbvdm1EyxTfWQfZtNWg2LnuRJfBI33DVE343P8cFMKQ+VhfqZFr502t7B
	 spIf/Ac9nnPzEFZHLINi3I+GptnjTvy7ukbo0j1rn3dFtvXIyOpeVx+XwAN9OAfpDE
	 hAchqV8GjPoOAUAFD1CqsqvrnnyMcLiQ/1p8XLgvG/0ujaqX3izA7Mvn++eCJu1r2j
	 gteyIkmBqUegQ==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id d129b7ef-0abc-4681-95c1-101067508816;
	Sat, 14 Nov 2026 10:08:03 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 6/6] wifi: ath10k: usb: remove the experimental status
Date: Sat, 14 Nov 2026 10:07:37 +0100
Message-ID: <20261114090737.64348-7-tomaspaukrt@email.cz>
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

The USB support is functional now. A QCA9377 USB device can be probed,
started, stopped, unloaded and connected to a protected network, so
remove the warning that tells the user not to expect anything to work
and the experimental status from the Kconfig entry.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/Kconfig | 5 ++---
 drivers/net/wireless/ath/ath10k/usb.c   | 3 ---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index efb9f022d8c6..a727cd73ec09 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -34,11 +34,10 @@ config ATH10K_SDIO
 	  This module adds support for SDIO/MMC bus.
 
 config ATH10K_USB
-	tristate "Atheros ath10k USB support (EXPERIMENTAL)"
+	tristate "Atheros ath10k USB support"
 	depends on ATH10K && USB
 	help
-	  This module adds experimental support for USB bus. Currently
-	  work in progress and will not fully work.
+	  This module adds support for USB bus.
 
 config ATH10K_SNOC
 	tristate "Qualcomm ath10k SNOC support"
diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 9804ea0ffacb..e23d87c84069 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1081,9 +1081,6 @@ static int ath10k_usb_probe(struct usb_interface *interface,
 		goto err_usb_destroy;
 	}
 
-	/* TODO: remove this once USB support is fully implemented */
-	ath10k_warn(ar, "Warning: ath10k USB support is incomplete, don't expect anything to work!\n");
-
 	return 0;
 
 err_usb_destroy:
-- 
2.43.0

