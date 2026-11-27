Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800961;
	b=1zp55Vf2ZVuyZd2E7Uxxkn7rwGEeGBjaUr1eBUB5EJXOkeJiHlF0UMS+0n0WznOMpdKd
	 yj/nBcC8OtsxOvgAXoOhzbkSVwL83Vv2q4de8dFMaRfm2ePm4nqtRnp7U9bedBx6xRH1r
	 sFvr6QD6fcN0kjRuP+Qsyih5HSRAQlAIYD0kn2vFkeQXkgdncketvT2Ry78lS5qQaL4bQ
	 WOaa2eBT58RREPWSEPh2EbndoZ+4+/TP2gUY/bOT95cLW8jxggyVevuVISz2njZohSNk6
	 ae86XN+dXimwUvsIWekaOOmMNRyJ2PWSM5JKWCeRjQNuSuZfzepKexHpooUjBmAPPHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800961;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sxJnaA5r8+pqJwlTwREWQ9u52lC/5QwuG+vW7LNFuFI=;
	b=X80c5KBNK70zbIrkMWFcwLZISyqP/e0iVMeASx2xtMzyX5X7VzQY6HGtI0carTg629W6
	 mLKAS6+JTCRZMVIA1xmERwf1lz6AV4MuX1VQxMXfHB5eAjuuGeCkKSaD/AvLl3dmYz2Kh
	 6vzSJZ1ZL3spXnc9b+59px9yd43HisH2sTbBwGDco24iWM4QcftNx1CegqBTh3hGDtNoh
	 Gbk1HO+ygdxCHS6fTWItm75bHYfuj255C7dC4dKrhxszWZDwEn6JpkQ26ct8y5xRtMebz
	 UYf04jNqjNzN0TnZRYPHwjUOyESg5H8zNQOkHSQItAx0Uqcmw/MalSQUdfApxQK0Zxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=XF8aGEY8;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89FE606A326;
	Fri, 27 Nov 2026 17:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E89FE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=XF8aGEY8
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795800959;
	bh=YXbjIqGdUWKxMXSjC2GBavJThS3DJuHBVwnFIC6J87Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XF8aGEY8C+uaNpCc0v1g8e2lJ4kUxcm3TxJ1CdVqH0SmPMnXS/kF/HmbN/62mG63I
	 MXgMsmJB7O+mi2yDcgPgvcv0Mg00PEc7WrStFJrq6PFlgEq6r9gYi1VQ14t9KVUwdX
	 ZbQ8IzY0xzZaSo6eeV/gtyO/ONHyNMARiGg2HExvBW7KwEEEb3bKq2PmV064Zu2II/
	 fWfcKYXMIvdQLFJZgmmmH0eu3eNQmxMXBnbB5xAu0uo6z3aDrfWE2D8dWbPa8s3u46
	 TATY9F4pB/VIu6yB3QexcHdgE1TXIrFKjFMgooSyrT0mOKyWFdoNf/LBK1Tm6QpzIh
	 6TxcdrwZVP+ow==
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
Subject: [PATCH wireless-next v3 1/5] wifi: brcmfmac: pcie: set the state before D0_INFORM on resume
Date: Fri, 27 Nov 2026 18:35:45 +0100
Message-ID: <20261127173549.29335-2-dev@deq.rocks>
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

With the mailbox on the control ring, D0_INFORM goes through the ring
write path, which refuses to write while devinfo->state is DOWN.
brcmf_pcie_pm_leave_D3() sets the state only after D0_INFORM, so every
hot resume fails and falls back to remove and re-probe:

  brcmf_pcie_send_mb_data: Failed to send H2D mailbox data (-5)

Set the state before D0_INFORM and back to DOWN when the hot resume
fails.

Fixes: a83a99d063a0 ("wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware")
Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 00ecb9c9925..6f329eca2cd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -3101,10 +3101,10 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
 	/* Check if device is still up and running, if so we are ready */
 	if (brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->intmask) != 0) {
 		brcmf_dbg(PCIE, "Try to wakeup device....\n");
+		devinfo->state = BRCMFMAC_PCIE_STATE_UP;
 		if (brcmf_pcie_send_mb_data(devinfo, BRCMF_H2D_HOST_D0_INFORM))
 			goto cleanup;
 		brcmf_dbg(PCIE, "Hot resume, continue....\n");
-		devinfo->state = BRCMFMAC_PCIE_STATE_UP;
 		brcmf_pcie_select_core(devinfo, BCMA_CORE_PCIE2);
 		brcmf_bus_change_state(bus, BRCMF_BUS_UP);
 		brcmf_pcie_intr_enable(devinfo);
@@ -3114,6 +3114,7 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
 	}
 
 cleanup:
+	devinfo->state = BRCMFMAC_PCIE_STATE_DOWN;
 	brcmf_chip_detach(devinfo->ci);
 	devinfo->ci = NULL;
 	pdev = devinfo->pdev;
-- 
2.56.0

