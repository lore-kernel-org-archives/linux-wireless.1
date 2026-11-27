Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795740546;
	b=J/Y20yOfiqeALB2r8E1dwLfcpre2t11pkGtjGtAtka11QUq7tHaDgdlvpJe5zkO/73pE
	 snTGpRlm7jeXjmSAYe+85FP/hBb5NL8+1+tg14Sd/NBdgM0HFRmqr7fXQ8zD0BmlToZv4
	 bxNoXR8Jjjqa+s2Dzrhx+JKIwC33EPCiLDxSUy6Hs8nP22hKJMyixU65dneleLpcnTp0K
	 snbw2WYupkl6xcz3vrq2cvOsDS/cM+3IvoW3rin+LPWRX1nynIYDdda/eqFKK09wMTRuB
	 jVC9LKy2ob/RrQAQIjFsp6I/1rLvhRvRMnUyWdvu09eW7lIFG2gTulY/++NypwKLrGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0snGaQWC19GTFkILdN/2yzoYXzCXLuGVq7u3ACjroNQ=;
	b=HWJQkbF03Seks/gAJX7qYMsTsSMWTXtbsX9rSTkUxDli5GnqZKGZLI4xfSNK4Ih2xfoD
	 z8pVe4L4CSR7Wv+ow4ZS/rjCO5et8li+fYm6UZCnkjaGG0F4cLeSQdyDacX71waFLBfWU
	 4r+taSbIuq6aB/Ys/CRvnZdGl6lXtd4KrubM9ssRyHwH7NtiL1KLZGdDJrH2PXG4HBhBy
	 6Re/pizGAJvO05MU0jTjA5XdX51FruMtb+CvUBWtcgGwobApebM3rHiH97+i3HT0QmJhJ
	 hkhw2YHnVUJdzdJB9Lu0e2tXpLZbRO2yMz3MQgXj27lnEdsr4Ed3zPv9VcDDSv8tKTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dCpcu3t9;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DCA606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 00:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4DCA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dCpcu3t9
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3866a784546so10305412eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795740545; x=1796345345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0snGaQWC19GTFkILdN/2yzoYXzCXLuGVq7u3ACjroNQ=;
        b=dCpcu3t9NAFZX1Piwjr7XMeu+OO3Blu1bs20zIWVhdaLtpPImOO6pnEYSt2gb78gMa
         Smszd08Y5TMA95ZzQTu8dGYRHG6vTl5bjgrpJvPq/yxB2UbSxf9gDQf7ZCnkz+FmGcl8
         jKgnmPPMByKIzveGKyxhDjvfLidC4RAEef6fwESvLUv3YTVEOm8UueJwn24bn2nVji0T
         WtU/8T1rDorc/23RxybhDMfaSuX2JTuibhPUKUpw2SHdnxWx9+gjDIfq1D90UGcJ3S5t
         4eTsquUiRz4f/DPM+5MBF62Oy07yl3NZSMSfWpqF7BhhbLUPP9ACWVN6njydtSCSviC3
         ziZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795740545; x=1796345345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0snGaQWC19GTFkILdN/2yzoYXzCXLuGVq7u3ACjroNQ=;
        b=GVDKFZ41LfnDQbkK3vSDG616R1JA6gdH+RmWOJbRV/1s0aLrIYNOBoK/lLATRxVyyD
         yYf1L/F/vgpq3Sy0nlmv0O0j6cCSFSMyxG7aXJFB/DUn4Xpp1hp3cRfvsceu2vLTJvnO
         ydyLOeqtj7jqWZMJham4nFAHbpgVLLhv0rMHBCctJfoj6wFTdn5oguXCxdgb7gIQOUCn
         9RMvPuj87lrVOD32qtqK5tPKSx6oMqL3bTCzeAgnUpFngTbAdDoJ//5gKd6TJkOrmxR8
         IT9wlA+mbLIkUf02JqjMhy5LTTyD103jt61JavgynQ2RVmr7RF1Cryw1xOZTvDcDYUqH
         0NSw==
X-Gm-Message-State: APuU4Z/ElEvU+kNCgJldyP1+gDcZhpy9yIbZS/pZgO64nnlv1LRZVxgv
	7M50UP5uktm32bHwDpF3hjdnCYUG5jVBFGqXTbo/7tNKfuyiCAbeT6aF
X-Gm-Gg: AZFdTZddxpb2Ci+ZXI4wiZjVm7ymhpsxUUuOyuRxb3eoSQiUwmMKI1DuW2qBYiLjqrp
	rFOI8hhZJUFUNF+7v0PdBMGXWQWzHnXoOE9blhHwTbfV7obZh3uKBaJzLhI6uhI+hHtpY30j/Zm
	fqftDqBpO78vQuazQFoSWwT5JMOW8Le4N0IgyncNuykPzqOXmvmC5pVnkKCybfTfhVmb4+5wnES
	CEqXHtlwth0sAztWejAOYy+gfnrQN9hRmenWiwRfbKwdxHV+MKprowRsWb0QcrXUo71tXnY2jjB
	hzabXWCJIC+QIwoJM2bl1id/HHJkLprGuE+rnINdH27tMr7d4j6F4VSLut6rVskKQZV6LnqmUkY
	jUfcWV4feIv0iEugcFPXoHfsjAAkH/Oqik/F4aace9yitpc3SS2S98tSwCyjO3dEq9XG90vaNK1
	r8doFA1iuEYzX+yV/Ag7VMQZewra7ewvasoKQWwA54+1K9pNvV1xOpx+zJMDWrnPPpUbywfMF/G
	miFgmwdA5cabDET80dNxD5efy13Psx0j5g8ovILI6U8hcPew5tEtM61UT3JYkKzGSA+P4ZLHDmr
	dHWNpuJuX4ivHxso9DbBrhiHQR9sjsE=
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr12202728eec.2.1795740544685;
        Thu, 26 Nov 2026 16:49:04 -0800 (PST)
Received: from penguine ([157.15.89.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm69566770eec.6.2026.11.26.16.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:49:04 -0800 (PST)
From: Swapnil Shinde <shindeswapnil028@gmail.com>
To: pkshih@realtek.com,
	kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Swapnil Shinde <shindeswapnil028@gmail.com>
Subject: [PATCH] wifi: rtw88: pci: Power off MAC and disable interrupts on shutdown
Date: Fri, 27 Nov 2026 06:18:22 +0530
Message-ID: <20261127004822.8536-1-shindeswapnil028@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Currently rtw_pci_shutdown() invokes chip->ops->shutdown() and
immediately transitions the device to PCI_D3hot without powering off
the MAC or disabling PCI interrupts when RTW_FLAG_POWERON is active.

On RTL8723DE combo cards, leaving the MAC powered across a warm reset
causes REG_APS_FSMCO polling (offset 0x5, mask 0x1) to time out with
-EBUSY (-16) on the next boot. Power off the MAC under rtwdev->mutex
and disable PCI interrupts before entering PCI_D3hot.

Signed-off-by: Swapnil Shinde <shindeswapnil028@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/pci.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index 66d2e5f51..b0bbb9397 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -1949,14 +1949,29 @@ void rtw_pci_shutdown(struct pci_dev *pdev)
 {
 	struct ieee80211_hw *hw = pci_get_drvdata(pdev);
 	struct rtw_dev *rtwdev;
+	struct rtw_pci *rtwpci;
 	const struct rtw_chip_info *chip;
 
 	if (!hw)
 		return;
 
 	rtwdev = hw->priv;
+	rtwpci = (struct rtw_pci *)rtwdev->priv;
 	chip = rtwdev->chip;
 
+	mutex_lock(&rtwdev->mutex);
+	if (test_bit(RTW_FLAG_POWERON, rtwdev->flags)) {
+		clear_bit(RTW_FLAG_RUNNING, rtwdev->flags);
+		clear_bit(RTW_FLAG_FW_RUNNING, rtwdev->flags);
+		rtw_power_off(rtwdev);
+		clear_bit(RTW_FLAG_POWERON, rtwdev->flags);
+	} else {
+		rtw_hci_link_ps(rtwdev, false);
+	}
+	mutex_unlock(&rtwdev->mutex);
+
+	rtw_pci_disable_interrupt(rtwdev, rtwpci);
+
 	if (chip->ops->shutdown)
 		chip->ops->shutdown(rtwdev);
 
-- 
2.56.0

