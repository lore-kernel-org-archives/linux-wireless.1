Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162575;
	b=nSLxLoUEAtywt0jFqbHRnANEbPspq6lcUXHk9LbpvMtIZf4HMjiqRLzL4vxWGaLAll01
	 A+WsrumQucitqwnhEtW8vrg8yCxzoSoxqsSj65b76ZvxINvMUVO4XSJ+kqFsqkgzDwtOT
	 /W5Ubj4jOeWUFgwuPYPDOZ0NAftOWr4CzEMoY70NcCamxZTn40YbWMDAaibVX7NJ2HsFU
	 w0HMHTmBeHz1IYEnwMXjWZfajgs6z1yh+nwpZ8yd2l0204yjKJa4Qh7fdqfFs89PYXZG8
	 lMXQh8tvsJu7TUgE0//DVT3TS7y1adOq7FgIG3lR1To4bvNshsj9V6HYLNCTfnIP8tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MdEqkKSdZF8rNouTB1DOceTxdJHEgpqHYMARfNT3BWE=;
	b=PEGH04sHz/Wd6HdmYPqOvJCxXlFcHa+FAyy5OwRrslREsj740sEu1UjcHmMqPhQciqjw
	 ruC5zoH8LLA55YR3wxFF/jKkubeUWceTx0aS9+6n6oGwCC00D0Aan5hrv018z12oWzkNF
	 cqk6cBl7LtrYC+Sbx2k4YuJ0AfncXFMCQlGVftmURU1ZofceU3bIdNVF++uj3sm7VNs1j
	 0qrYaNWrTYMOY6cQmnw940BY1/0/y14uvxUd21RyGIN6pShTwaLQVATuXTXWc22svWNtp
	 PAeqcPZmiBASSZMsr1FGpkrKmHg37rvX7TioVvjw8eqIp3ECeE/wByqiHXsWP6ZLBFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttbBnHyp;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642B4606A320
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 18:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 642B4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttbBnHyp
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so64133b3a.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 10:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162575; x=1794767375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdEqkKSdZF8rNouTB1DOceTxdJHEgpqHYMARfNT3BWE=;
        b=ttbBnHypf5CxMR05XVMr6MYTSiXBM/zngM2uF1jVCCFwHmqcBFpMYOYVLeCpFhX+4N
         T9KMzxyotCkf1KMDz/0HAp1JyaK6iJJ7U1fx+3ekaEn4ree9rUcjT7bDlJB4YzjWPHuK
         mmsZFozCLJHk3GdMvNRCcyyDOY3NHHoObh24IsOWvfGn2F7c3umz0IPUOWIRYZeBJDTe
         Zvq2GU6ofLQ26YKg9dcDUGNDQyLV07151SaQhL89N3zwXc3bf1cqgjYuLdak4jRG0AP6
         A//zdDvmamLxIw5qsS6hclYiOCV3L1lvELNDWFDaAenKP2XQqdo2HtX2IChi6IgsHaHz
         UiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162575; x=1794767375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MdEqkKSdZF8rNouTB1DOceTxdJHEgpqHYMARfNT3BWE=;
        b=O+/jcR5mJsWgBuCMkbKmYQjHZS6Hc04G4W+kzMN6rAzPuygQfScgidvRPhYeC+gVA4
         z3pbPse1PufuV2AYPZs7hG6AXK7/sWawcRMvNkWDSwX3SNmSvdipvi/7av0ji3BvjpPG
         cXBI9U1VeJuy2AFqG2E8kpF7O9DN/40sw7YcYBC0iH9+6kiViAWFzlpVLIB1AgzCSkI+
         Adgd0mp1pfjvP3BITZZihUAkVgKHtCHwjI8VLwIgoC9rjqgdepxkF2QdxK0uYGSz8b+4
         Hdckn2HKUfrGb9xrkDjXHW3c++jE6qU3wrom9PtkS7Wd3TeLGLBXtaaCdc4u5CXPWxc5
         X0ig==
X-Gm-Message-State: APuU4Z+MI4CAeHw1MU79pc7yhVUA5bqPH0bCsksFOrsFJ2dra9Nm044m
	aAfG1hJ7yhc9ipMzv1eeHVOCshrl7E0gzQ8SQ4gmThzIIeuWbxlHEOksgHSAmM8I
X-Gm-Gg: AYBFou1U3sIu1CV3KVbuYtspPqs/cPpFHyLW5ydCB5uKuAF1PnBAYS6AzDEokaH1h/D
	xDbhWwOMwwkcB9PXSrR7NqrJCrKGWAa5oA3j/Nh5vhNVeNrpnlvfhMveMsQhHUxuuJHh8rLa4d/
	wSbK9DOyWJ5VThawCtDsM0YZ4WfwhXzgd88YA7GlR1W3CG6mN+rbtk0ZePfAzX5cfTdi7Kf93tI
	GKl7mASLjEHIAOLwn93l8YvwDxipaiwndvBSiujAK9z/0W8xEfq/2sVZTBDYd0zdMk72JUC/Mmz
	wroOBwAbenVvbts1Lw6O6x9UccPO5NVDvUP0LsBXxlqwzZ6JPis3kF2mUBPPMBnmVroam28SkIp
	pf+W6FOdFXT9z6z9m/Wri3tJxT8cu8fZ1odjUw9Pmtx9HfzQ7BbTxzCJ0xSUT+DzFztLGCuGblB
	/hTJjFwbGY9fZipwq1zJSfS5Zi+Jp//v+O4ddcqBM14YaaNh27MiIJJhQynW+PDOqz/yNxIGeod
	iUxn0CCmbOktxtMOhSvOm3Y4MuxvORlB6GGwrDb0DEkjihNnl433VDeZL36eiNMbl+JOShBCtx4
	rqEqBB4IMtVkMDXT6+8pJ3uHYcSjOSypizg5uwVIH+3byyYa5qT8MJPqXUjZTtwhtnM29VM7T96
	wScPX3ImQCsKkcLmsRR/UmNFkOQTJ
X-Received: by 2002:a05:6a00:339a:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8b66c4017demr1724424b3a.20.1794162574625;
        Sun, 08 Nov 2026 10:29:34 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:9:5496:ab84:534b:ad67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b6498209a5sm692938b3a.36.2026.11.08.10.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:29:34 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH RESEND rtw-next v2 2/2] wifi: rtw88: 8822c: ignore nrx values without CCK PD registers
Date: Mon,  9 Nov 2026 00:28:37 +0600
Message-ID: <20261108182837.682661-3-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108182837.682661-1-zeshanahmednobin@gmail.com>
References: <20261108182837.682661-1-zeshanahmednobin@gmail.com>
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

rtw8822c_phy_cck_pd_set() reads nrx, the number of CCK RX paths minus
one, from a 2-bit register field. The driver only ever sets it to 0 or
1, for one or two RX paths (see rtw8822c_config_cck_rx_path()), and
rtw8822c_cck_pd_reg[] only has registers for those two values; its
entries for nrx 2 and 3 are all zero.

A device that stops responding can return any value. On USB, a failed
read returns whatever an earlier read left in the buffer, so bw can be
0 or 1 while nrx is 2 or 3. When the level then changes,
rtw8822c_phy_cck_pd_set_reg() gets past its WARN_ON(), which only
checks nrx against RTW_RF_PATH_MAX, and calls rtw_read32_mask() and
rtw_write32_mask() on register 0x0 with a zero mask. Both compute
__ffs(0), which is undefined, and the write puts back whatever was read
from register 0x0.

Return early when rtw8822c_cck_pd_reg[] has no registers for nrx; bw
has already been checked at that point.

The fix and this message were drafted with an AI coding assistant
(Claude Opus 5.5 by Anthropic), then reviewed and tested by the
submitter.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev/
Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
---

Notes:
    Testing, only on an RTL8822CE (PCIe). There a failed read gives all
    ones, so bw is 3 as well and patch 1 returns first. A debug-only change
    forced nrx to 2 on a working chip instead:
    - With this patch, in 12 s the function ran 6 times and returned early
      each time. rtw8822c_phy_cck_pd_set_reg() was never called with nrx 2,
      and there was no UBSAN report.
    - With the new check skipped, rtw8822c_phy_cck_pd_set_reg() ran with
      nrx 2, and UBSAN reported "shift exponent 64 is too large for 32-bit
      type 'unsigned int'" in rtw_read32_mask() and rtw_write32_mask().
    - Not tested on USB hardware.
    - Build-tested on rtw-next (dc16902cad9c) with W=1: no warnings.

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 6343568285bc..acd192684bb1 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -4413,6 +4413,14 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl)
 	if (bw >= ARRAY_SIZE(dm_info->cck_pd_lv))
 		return;
 
+	/*
+	 * rtw8822c_cck_pd_reg[] only has registers for one and two RX paths
+	 * (nrx 0 and 1); its entries for nrx 2 and 3 are all zero. A device
+	 * that stops responding can still return those values.
+	 */
+	if (!rtw8822c_cck_pd_reg[bw][nrx].mask_pd)
+		return;
+
 	rtw_dbg(rtwdev, RTW_DBG_PHY, "lv: (%d) -> (%d) bw=%d nr=%d cck_fa_avg=%d\n",
 		dm_info->cck_pd_lv[bw][nrx], new_lvl, bw, nrx,
 		dm_info->cck_fa_avg);
-- 
2.43.0

