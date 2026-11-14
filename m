Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.75.78.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647388;
	b=MTCzOUxKFoszSKl4tRcbIwfqaL5MkdDmK5yLEvp0ySixCmBlvRwana5W42HyxrQPy44T
	 nhSWqcSYshSj2MtiqA3AsO7u6IFn7l+3XXYofNYt/hUXvaE/N5NForV6VTKqO+QDZueKL
	 FcM9Afe3cTBD8ZPFrc8YulroDNU5sfC7UxgtFnSWEvaLsjP1jNkpNVi+blqZdmG5XUPFY
	 rDL0qIZGmFqg1OiR6Ml/iS6UBq0pNpqJkPJQBo3JZq0nez5kccRHANVL5EhkFxvkqVuIj
	 /FbHd1JZYEAoVeojXi5U/NxrrcH9S70ppwteZHzOKYrRFP0vHMhpJiFSCoTXfZ1Gvaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647388;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fZDaZLg+KcaSooSb0sjq9n8CHgLN/4LKPX7p9AG8Er8=;
	b=qk4w7xKJlC+NAaPL6ixc0ayfNYy+rC2bSEx9BHCiu2Yo6/ofz1PP1PPC9o932VhvSbJu
	 OylkO/FFmQkqS8jxeDCCXfoD8g/NyEulK85jWmlhL0sAK7Brz2DreFW6Abh2XGsL9aDeN
	 H1/Z4ouCrrBbkHTNw4RBcND5nvy4be66Cb4e7/6t5NJnaw/FJbkRP3BfDGsOV2eUH/J1b
	 vyulSW8OGpu/N4Hh+AaoPoLnNTuDu7zyTLSF1vh8sOWlzBC9959NO5NPmxIoxNPurMgwn
	 AcEpkigvfGLTAzsGmDfyPMSEblgycKpP8Df6z7ZUsMmtrrBge5xeuobFeJJ5zR5FkjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=email.cz;
	spf=pass smtp.mailfrom=email.cz;
	dkim=pass header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=AIZ6h1Mo;
	arc=none smtp.remote-ip=77.75.78.210
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1A606A32E
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 09:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E1A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=AIZ6h1Mo
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-dlhcx
	(smtpc-mxd-5f46658f7f-dlhcx [2a02:598:64:8a00::1000:a36])
	id 2759e788d9ad552227d76990;
	Sat, 14 Nov 2026 10:08:38 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647318; bh=fZDaZLg+KcaSooSb0sjq9n8CHgLN/4LKPX7p9AG8Er8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=AIZ6h1MocZDD7lFiEuPWD4MVKxeG7sdub5xSVvA+8Jeg2BKDVx9je6gapSf6Vkuw0
	 lgT2i1mPlZO8RbnO/aeQRxIAAR5KaDRi8JcWTWDW/be8Zw8e+OyI/1ODg2rjy5eI9J
	 ItIU6Aq6qjQhx1ObWs2s+kbhJCivKAkesQ02nbWzObKRt844LTDOskBPCGDmki52WR
	 e6wQ54bSkAzMBHsQ/L34PP6RAa/7ykdoJZeLtxfpfyIOguvLd4czVV8Q0w2/MtlUXM
	 LIBiWJtUkbs9AU00CgHj2EERMgWnxEX3iCeCA+InIW0MysiFnZJ/LxWvKdvCW3NuZZ
	 dMtcWsrz7amXA==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id f11e4f1c-c55b-4855-9539-63d0ffc76826;
	Sat, 14 Nov 2026 10:08:03 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 5/6] wifi: ath10k: usb: add device ID for Atheros QCA9377-7
Date: Sat, 14 Nov 2026 10:07:36 +0100
Message-ID: <20261114090737.64348-6-tomaspaukrt@email.cz>
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

Add USB device ID for modules based on Atheros QCA9377-7 chipset like
8devices BLUE bean or SparkLAN WUBQ-159ACN.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 71de38111c5e..9804ea0ffacb 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1156,6 +1156,7 @@ static int ath10k_usb_pm_resume(struct usb_interface *interface)
 
 /* table of devices that work with this driver */
 static struct usb_device_id ath10k_usb_ids[] = {
+	{USB_DEVICE(0x0cf3, 0x9378)}, /* Atheros QCA9377-7 */
 	{USB_DEVICE(0x13b1, 0x0042)}, /* Linksys WUSB6100M */
 	{ /* Terminating entry */ },
 };
-- 
2.43.0

