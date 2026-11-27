Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800966;
	b=YS/2BllBtmGwNQNHcX2qNvChqIwBzwFJjhpgLOZwOD4UxrYaNuyMIena98JWTnNMm83h
	 taisIq6qmtpfqVGeSYymJvirq4jiFSShYHUwH77/1rIHMmmABfloSfPoZauXwIT27GEbq
	 BhzaMyvz9G4lIXgBTL5K/Yo/oBJjT+ADeEYXs+g9pHoyQnok37PGpBXqKEWMPO6UgFNjZ
	 W+OKPsmqFqtqB8rgKW+tJYUBXf4bv6MIA8atp+jGGt5iqw9Q8HYWfLKNs/t2e/a2cxZzN
	 25AI9yQY10sXoLVlpdgUEMhU5sW8TacHVh/Nf8h4tUiL+lxT2z7erLv4dtM6caAIDug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800966;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GUySmqfMLE9wm4JUG4oeEO23d2umvrzqKPsHvu1jeWc=;
	b=kqXxbGktnkaC1eK1TUag7fBWowYXSI+bseDX37VHLDLXYowbIme5EphZCf3uTW2mfXla
	 ZexVvTmUwEGSrw6Io859cWwzDefnPmuCs7B2RgZMYYBYNyIOICPETIYxZvmMxsay0rvrd
	 QCu33lFCsesZCyVDgSNCtCV2IHkj6OZvgBW1qdoXqsbTsc0tdE8uncA3tZOcGphyR0dEb
	 ObsU+E/hTsIWZoU0z4KJzFoo9cRn3ucJB94YQcPP+dVXgqMpoKRBIvWDSFfRAFwbcoAhf
	 bmyuvXAT1kOyyiW3QRctnenQ6/pXsKxZat2VHT8KqS7uGV71NV5bFv1dZ0vACaxSN5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=IoN3ufBF;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DE5606A691;
	Fri, 27 Nov 2026 17:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44DE5606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=IoN3ufBF
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795800964;
	bh=xbFogpTo10Nxw4ZICdjJ5rlqffoyRrSmEJpftWjtOBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IoN3ufBFAv/wwY7d3gnBO+xdWQA6Cr4z1L7m599CJLe08qfmS42RDx5y9P0rkgj5w
	 6eCcFOhm9aJ0bnsx2Tr6UMEQAcG37hE7LB3ratGWTDu1XxvJhvu9wHL6B6JZxPvkrP
	 pz8MrzGHkvKADLO+xE9Eh45GbxPy2LZnB4mlTmZ8AfnhqlT6Nev2LN+kvmbbCpByBE
	 Q6LGwyhNndBcO+5WnXN3EfeVpfDpNPCNylPDDqrhdKRkR8XnN/JQsReaAYwRo46+4E
	 m57+TgmgOiQ3jDsojRg28BbGSDGG7x+gJDUtli0Mu3wcrpXS5yZcH1MwZu5Jv93SHr
	 A6dOQl3Qi5URw==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com,
	Soeren Coremans <sorencoremans@gmail.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: [PATCH wireless-next v3 3/5] wifi: brcmfmac: pcie: probe again after a resume through firmware
Date: Fri, 27 Nov 2026 18:35:47 +0100
Message-ID: <20261127173549.29335-4-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127173549.29335-1-dev@deq.rocks>
References: <20261127173549.29335-1-dev@deq.rocks>
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

After ACPI S3 the BCM4364 and BCM4377 of the T2 Macs come back without
their firmware, but the interrupt mask can read back nonzero, so
brcmf_pcie_pm_leave_D3() takes the hot resume path and every command
times out afterwards.

On these chips, when the platform firmware handled the resume and WoWL
is off, go straight to the existing remove and re-probe path. Other
chips keep the hot resume path.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 4aed21061dd..ea51ef6189d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/pci.h>
+#include <linux/suspend.h>
 #include <linux/vmalloc.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -3107,6 +3108,17 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
 	devinfo = bus->bus_priv.pcie->devinfo;
 	brcmf_dbg(PCIE, "Enter, dev=%p, bus=%p\n", dev, bus);
 
+	/*
+	 * Without WoWL the BCM4364 and BCM4377 of the T2 Macs are powered off
+	 * when the platform firmware handles the system sleep, as with ACPI
+	 * S3, and come back without their firmware. Their registers can still
+	 * read back nonzero, so probe them again.
+	 */
+	if (pm_resume_via_firmware() && !devinfo->wowl_enabled &&
+	    (devinfo->ci->chip == BRCM_CC_4364_CHIP_ID ||
+	     devinfo->ci->chip == BRCM_CC_4377_CHIP_ID))
+		goto cleanup;
+
 	/* Check if device is still up and running, if so we are ready */
 	if (brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->intmask) != 0) {
 		brcmf_dbg(PCIE, "Try to wakeup device....\n");
-- 
2.56.0

