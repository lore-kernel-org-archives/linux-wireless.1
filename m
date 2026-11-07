Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794076518;
	b=NZYM8oJIhn/UJB2WNuSiilYp3wOOfS+029ZUKbmr0cZFvwlpsavVQT9ZDozLPwWZa673
	 bKijmFBth8bGNfoIcvPlBV3A3RBPfIOdspRM6mRSuLV/lMtNL1ZHwb9WUDvDkRKHaQvdu
	 pss8wIoOpLuRvG3t/jiNjb9cDbdRhsFMLv7X4Pa07pRmN7UbKoK5MxYm4y0RaXnYWbeuQ
	 zPYbAjH3fS0f3cib2vFjaWnY7vAOYIYMhDQ8gtx2OXFQuXj+yMr/eP07Zw6/oAbMUDLC/
	 +rKk1sFjE/C4AbAYep0BBBNk2f4agbxzcv+1G+zB1Ms/Qgm9rjyyTCdB+alcQFWcjLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794076518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MdEqkKSdZF8rNouTB1DOceTxdJHEgpqHYMARfNT3BWE=;
	b=XQAFI7GOGJnJr5U/Ss0KFkVqE/6F8gL4sEshQc62OGJ8ixYnyYF50PS7agr0/cb/Avtc
	 Pp0ReHRIFo1VDvC//5/dbI6jWg54mMoYLyTXTbBtqesqKe8JkhI5LFkhbrZ2IG5J6/Rzf
	 ypfUGQwj3GruIfK59TJySum5P4xgibSL6+BGxLSX7NjLJVnXwy32YuqB38wzBrOv/fQDT
	 FExYDnjnir8vkiIlgO7qC9tnfO3m7I+rwxmV1FYo6QMflAuuElmN+xvUrlj8Y3gAbTSK1
	 szTAF/0IkHUTvE50zFbWzpGKndebbcYmLuQ/aLWWL88wL9vss4Xl3FzH2DKXVBd3DfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5rOwm5g;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A00606A326
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 18:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5rOwm5g
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b2382bf051so751415b3a.3
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 10:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794076517; x=1794681317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdEqkKSdZF8rNouTB1DOceTxdJHEgpqHYMARfNT3BWE=;
        b=b5rOwm5gB72k54Zts/gMnadp1prmqmmr0MVc8WRfmKZl1xZ3UJRXcKEi13fzgfcC7V
         XBLvglVrSReFxqrijwCbuF4j2mAEW34ly85KqI4y1cYWlxBNJvSfc1oKHhSraLo11xKE
         Ulv6mXEe4Lx0V4P+nFS0LEpvwatdig6IIOGTC04aCAZbqCT9zjmDmMnVhE01++SNNYlI
         QC6oPiYNiw5WQTufp9u/UVETDjrco7bnVA+f5h+egCaP3xv62/h9awx48Maestaww0IR
         tPIRNZssk6bKaRWdZtXjeGOm3AwG6T9+nZkZqMd/D7CuhUQhALpAamXVIVXoWh8GRz+K
         dFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794076517; x=1794681317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MdEqkKSdZF8rNouTB1DOceTxdJHEgpqHYMARfNT3BWE=;
        b=0+sOvP/w6F7E7gMcPzZNruLsSLNcWvNz9h/OmLZr7yXcndwszC2En7B/uP/A07Ma6I
         dNqv4ESIvknHA+ApURub7sqwmyjOK5OzI+cWwXtBRFXUWexdR9JWU52VfZfBKE4uhieU
         ixg9nRSTjW5gSAxF3viLb2ZmnJs0n305gu+u5Y8yKCCqBakhzNnJ0Oa09Id95p/Ez7+F
         KA9tfx5f9E35Rs9yh1Lgz8Dcylm1T/qbXKM3C5HuenrUo1Vq7WGgvQXK4TX514GEwH4e
         6ryqwb9aj0JDBqgon5/9ZOfo9GTKABf7dvpbUic3bLkjCkk/wNFau23dvb6Vv9CmHmdr
         Y1lw==
X-Gm-Message-State: APuU4Z+hMTyVwobM7Qs4DGcOtoynjgb7JwmQOV5bt9p5BaJ7ncvYiJfg
	PLcfExDkA6EZq0Rc/VCo5BCrwxMVcHq8B34bmPAwTpL5KjiAsbcAbBmeRS8lIvHL
X-Gm-Gg: AYBFou0MlwNfRYjGswYj3JNhZ8FztIKArozg9ZyIsjwEL8oQmN/DiuV5h4n+JoJV3dJ
	q8IMKa8P36ynAWuaN+nbLUfzBYPX7VLvyTnQDKN3CrquC+Vk3/uCREEhXynujzSM7sQx9NA8K0f
	hix0XE3xahowdEKTTr7L2Ab3VYw28dBJtoBbR3oYy+ELA+SxMDbIlGqQCeawQevS6TaQFxttTX7
	2qHdBhE+Eyvk8YFLQ6/rYJDZiVfobxYmu8zJsCXT43/lK/wXdPGYObM2LMdNQ3V0l7hN9sHqWHT
	wYXrsdfLAXxKeW7TClJtGJNdBkeQu2AGhm1j+IlUpGl9IRPnP1Fq9apmbPhPo8JMY1Oy+ABd4cp
	RxmuDNDtfvbFQwcCa81TsEm5pgoss/AGHP7LlGRU96DmmwhhsyMkto/Epx9UjmkNYE4dp+TROYB
	VH+it8JcffUIZLQZ65O8sxz6qYc5MTlFNqNSwKY4dETx7fYDcrEravkNZr3hyr9LYIE7D5KQwPJ
	/Vbg9M//vAYmYMgbC1oGHNpDXOJ14ivZuF9gt8zT25m7yYFErq4QgpISJk9XyP0zsLHrlOcqDc3
	WvmLuk2N42WZ7uwX1LJKzcoJkm+lVikb6qXSoSSUdU6fn4yOwhW/bPFzLXg2MYln3Nl6OBC3IKw
	0/6yvwo/2vHfacu3Lvru6z274BRfQOg==
X-Received: by 2002:a05:6a21:6452:b0:3de:46cc:b641 with SMTP id adf61e73a8af0-3ebb26dc35fmr5979670637.8.1794076517152;
        Sat, 07 Nov 2026 10:35:17 -0800 (PST)
Received: from localhost.localdomain ([59.153.103.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35921db07sm1332019b3a.15.2026.11.07.10.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:35:16 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH rtw-next v2 2/2] wifi: rtw88: 8822c: ignore nrx values without CCK PD registers
Date: Sun,  8 Nov 2026 00:34:03 +0600
Message-ID: <20261107183403.50696-3-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107183403.50696-1-zeshanahmednobin@gmail.com>
References: <20261107183403.50696-1-zeshanahmednobin@gmail.com>
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

