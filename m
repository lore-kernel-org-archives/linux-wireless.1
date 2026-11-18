Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965995;
	b=y7vJx+X865SjR3ATWikZOFqZ2bQbujAT1OjMGKixFRIKpCEHZkTmx+uvzCFYfelrgfIf
	 0jybaX6GuzWFbABjwYf0CPi3GltUUz/plOPyHTr7miQp54DaXSGXJj+VV+eVWdm5ioBzz
	 9riNUWZrzN7fW07CaNjbHlcbUVy71epmrKLYMvyhtkDpLDHQ7FoSPXrJ7fMvTrYf7j4Qc
	 sZC/xMowQDIQ2JmJvlTBu7Pk1MpNYhoFX0NZnbS9Ie9y9pn72oiGY2nSxTD8CmqzlSVbb
	 ksQlxA0ur3Q/H4mZsDk7vI72BBfs+vwvGbRNWH/4e+HkSLgrIOAGWbHeyYQcUqp/UZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965995;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kxhlh8Ih28qrmQ0WUzoobXc56qikcMPA3uU4iVFRsqs=;
	b=OeTG04/or1oAgU5wLzM/50jizwJDCWeU9YzBRhtXZRiG8smzSJdBs4CDn2jJWuCh54Vi
	 ubejwhaJ8PpDX4a+xXOq3HVoSwnP+lcXMaTmo672vWb/hfjhYbooKQo9IVUhanFxr+vrd
	 lC+7+NekHCgzcECExh0lVnY94/CImZxii0ErNGw7GaRRU4nBjFjl1lQ+0DExgtVMsCXdL
	 s1s7jwC7arOWP2UWS/YqX5s3S0vJJga11p6ojCxsUmyPe4MtPp1ec2lAbTQr/PwBdKQ/p
	 H//Z2s0UckAIJjJtQJuO2u/EfKzym/WRHg/7nJfDR4p+j8HpgoDvd7h8nJItRr8dIwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=x+JxVhbx;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478BC606A337;
	Wed, 18 Nov 2026 01:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478BC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=x+JxVhbx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=x+JxVhbx/P4CJ8s10o6++TwuQiO5mfnjDgV/iPBUaZhbPrQsAA3wWytdS5nUwo1+YQOiioq4vYpvk
	 +FO4EVdberwTRaNri+VXcfMbJGTcGMDehvdum4XVPecqBYte6Y1rSWM5vZT36Ie+w00ZQXuiPUNaVO
	 mUdMer4Nz2Nb5PpY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afd01e779b-adb5c;
	Wed, 18 Nov 2026 09:39:53 +0800 (CST)
X-RM-TRANSID:2ee46afd01e779b-adb5c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56afd01e74df-c3ff7;
	Wed, 18 Nov 2026 09:39:53 +0800 (CST)
X-RM-TRANSID:2ee56afd01e74df-c3ff7
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] wifi: mt76: mt7915: fix clock leak in mt798x_wmac_init()
Date: Wed, 18 Nov 2026 09:39:51 +0800
Message-ID: <20261118013951.1710-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

mt798x_wmac_init() enables the "mcu" and "ap2conn" clocks with
clk_prepare_enable() but never disables them, not even when a later
step of the probe fails (the devm_platform_ioremap_resource() and
devm_reset_control_get() calls below). The clocks stay prepared and
enabled after a failed probe.

Use devm_clk_get_enabled() to get and enable them, so the clocks are
automatically disabled and their references released if the probe
fails after them or when the driver detaches.

Fixes: cd85efdfd099 ("mt76: mt7915: configure soc clocks in mt7986_wmac_init")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index 13fba2a06..d4fc3039c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -1193,16 +1193,12 @@ static int mt798x_wmac_init(struct mt7915_dev *dev)
 	struct platform_device *pfdev = to_platform_device(pdev);
 	struct clk *mcu_clk, *ap_conn_clk;
 
-	mcu_clk = devm_clk_get(pdev, "mcu");
+	mcu_clk = devm_clk_get_enabled(pdev, "mcu");
 	if (IS_ERR(mcu_clk))
-		dev_err(pdev, "mcu clock not found\n");
-	else if (clk_prepare_enable(mcu_clk))
 		dev_err(pdev, "mcu clock configuration failed\n");
 
-	ap_conn_clk = devm_clk_get(pdev, "ap2conn");
+	ap_conn_clk = devm_clk_get_enabled(pdev, "ap2conn");
 	if (IS_ERR(ap_conn_clk))
-		dev_err(pdev, "ap2conn clock not found\n");
-	else if (clk_prepare_enable(ap_conn_clk))
 		dev_err(pdev, "ap2conn clock configuration failed\n");
 
 	dev->dcm = devm_platform_ioremap_resource(pfdev, 1);
-- 
2.50.1.windows.1



