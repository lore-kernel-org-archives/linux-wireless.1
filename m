Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336259;
	b=2VVOmehN2UCM8693tMJloLAGmrnvn5yjbPKKKMNibG4lbeuQBsIvM7K+omTxFOMqYYmR
	 23CRjZse2xvTzsEY46tyvmsz9CWrby9vgfqXnggN4mau3Xbkftj3bzypwUADza2GQ+u/D
	 +zn2kTHlcAktNbM4HWnj3npep3pNEBW+gwkHCSaNtdezv5QKCdzCcbdC97i2eUFNJHGIr
	 xmskrpDf3e6at3gaPcS1o2p8CV0hMnixh9OQyn9ltF9LQhNfIiFylAj+crIlTbpk3kK8m
	 8gcpqFAb3DqmqvaxrnEa/Zvt4f6s7q66ZcAlKP3XpUzZ5S2dO78XYwD5CB8JqBRDZpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4DDwnKu6rYRHQfo6CNzHsjTmYdeML/TrBGtrikCBhO8=;
	b=G+LlrSguWj+X5KJUAkZ5FPnBAUghmZdf++ZHFSNyAe99lPmO4lvOw7Ze9x//cyBLukeE
	 OXOCHG+1wZWCkYPNsBtXs/FdYWAjV/6bJ7W2QWolkZKklVhXNVdVaP3qVsi4orqsiCRgK
	 m++pTBhSEFTcwtZ2wKSVuzNXDkxSqL6pg5+C3SEWE5t9K83DMtOTlvo/6B/87zVt+qtDJ
	 TOq7AtufFvN8iuuhsMkvRHkW/TsAaiUzl18L2tMYpm/Wehkr8Fxp4SD8JR+/KesBJCmBt
	 SdNUPQxEGEb2G5p19dGjdG7Yos5JEyj3YZLwcFiEWjM4+m/Ip4XTBZYMuXQSc60RRAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZjGM/NKK";
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B29160A2630
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 18:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B29160A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZjGM/NKK
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-70059e4dab6so1310247eaf.3
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 10:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336258; x=1794941058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DDwnKu6rYRHQfo6CNzHsjTmYdeML/TrBGtrikCBhO8=;
        b=ZjGM/NKKIahyCdeAEugfhBaswvi4jQuac0fGU9sb1F/Fg2H5FLlQ5hEV1IU0zCIIUi
         8QbV6WhvFJsrCemnCgMd6siOe0bNfQP7exJ+T8zYW6OdnYjV31fORtQsFYkuDpoYgQBR
         ipAagzkoopuDdmDHjo4OBM8RHhxzD0beMQwyelV3V38dyQto/5XouRc2FPdZopS1rMMW
         Nb5wLcAVFyOFs/SFUB1so3ioDJ6558g2Bg5vfhnjYV+SM2JjykEei7nIJvV429DJGNmw
         twLD9Vb7csxdwF61YyMHPhux7ZFti3HU4sdpF+d7k//0RVlDp5MAc2gMxKhq9fTxsMhV
         JsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336258; x=1794941058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DDwnKu6rYRHQfo6CNzHsjTmYdeML/TrBGtrikCBhO8=;
        b=IazIqWhc5/0BEyZPBKgPBvO7phu1CCdh/XI1DlxpSp1FqISuybobkaur5i3+TN7+qR
         3bK+iSD41erovlazHvz3Ln73p1LH7XbqE8ZRZipGXYooFXrrE38Feh+b9moTngQt+nVD
         aY5p9vmyOrHp8F1WSasSOK159RyBanczF6m8/8XE7BbwFw/Wwru1Ia1OjU7uJdFaWW2g
         xDMcXKD7SM8Eqt8HBXZi9FNy4jGNqYSR2Xj5tM4k9nnKvIa9xJ03J5AhvgBMeyL+8aIV
         HGjHAwS9v+I0TIC3UAqe/7mF9oxBizDWH3u8PKPEXqIexC7fqg+bHbDQPOd+pUilIba0
         DVQQ==
X-Gm-Message-State: APuU4Z9Ss/AOxo+pNtqtcdPlwyky1SlIvGr/FAS7cUQJvX8RAp+pu3Xo
	p2hApgDtwEb3YEl5WZeMXxYpKhZhQ1xcer6S96kA8UnelV13iHJhnbEa
X-Gm-Gg: AYBFou3rK10yZ7yWo41Xyej2sRYEW2Eo7bQes+rj/0eF1HIwL2cfxDETcriuowg9sxS
	ArZyHMYhs0nAlSnNucQxuWgzgDJ0zK+8MDFJojrXhS9jypFaZITf5rejTYwmamIZQNJnuYVnUGT
	48OrcA1jKx+rMEcW3B7tbPylM5OnLTC6Fva3BNsQ39Vaf6sYzM9c8Ao2cG7a8mB7nkXpuBUd3js
	7d9UcUgfjPFsPd+cJQct8/CUsZdLGmslJIutzpfIiY/bZPDfSBdcJcAQSgCRU52xqsOh9+YjTrD
	vUoQ8Syxo0g3G/kDLqC2L9DLyPe2Q6W1k6pdQQZ9vtzAx5jS9EGwY7ASuo7h+8BivYbZk8c4Lk4
	BSIgEcZEBTlhfihElWuk9M3/IvA1wca4uagR+gOgPK2ryjq16kIFlE5lfbEhnX/v3Apc1rRAY+e
	s3Vh2gBG7prP8Sn2gB4EdhquEhU/YWQiBQJLxhlXRDYFBde4Xd8edw3Gb1AMIFh4olfJ+0tuGJi
	G+/dFm/GEKcMQ1ntekxjpQGjXXIAFYvlf8W4XgT8grvAHW6W5NlAw59yukWjeWxdd/2bkiaOP38
	x4YfOo2PRcgbZYOJBX9vJ397dXVb0+WDiw==
X-Received: by 2002:a05:6820:c0d4:20b0:6da:9dae:a2b with SMTP id 006d021491bc7-718a576b1e8mr1386827eaf.18.1794336258196;
        Tue, 10 Nov 2026 10:44:18 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:16 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 6/6] wifi: rtlwifi: remove byte(), packet_get_type() and FILL_OCTET_STRING()
Date: Tue, 10 Nov 2026 12:44:09 -0600
Message-ID: <20261110184409.42205-7-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
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

byte() in wifi.h has a single user. rtl8192se takes the low byte of the
firmware header version with it, which is just a mask. Open code that
as & 0xff.

packet_get_type() and FILL_OCTET_STRING() have no users at all.
packet_get_type() also refers to EF1BYTE(), which no longer exists in
the driver, so it could not be used even if someone wanted to.

Remove the three macros.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
Assisted-by: Claude:claude-fable-5-1
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c | 2 +-
 drivers/net/wireless/realtek/rtlwifi/wifi.h         | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
index 0719d0bb2cac..c18d5fffb0a1 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
@@ -334,7 +334,7 @@ int rtl92s_download_fw(struct ieee80211_hw *hw)
 	/* 1. Retrieve FW header. */
 	firmware->pfwheader = (struct fw_hdr *) puc_mappedfile;
 	pfwheader = firmware->pfwheader;
-	firmware->firmwareversion =  byte(pfwheader->version, 0);
+	firmware->firmwareversion = pfwheader->version & 0xff;
 	firmware->pfwheader->fwpriv.hci_sel = 1;/* pcie */
 
 	rtl_dbg(rtlpriv, COMP_INIT, DBG_LOUD,
diff --git a/drivers/net/wireless/realtek/rtlwifi/wifi.h b/drivers/net/wireless/realtek/rtlwifi/wifi.h
index e289a88e9666..98b685754e8a 100644
--- a/drivers/net/wireless/realtek/rtlwifi/wifi.h
+++ b/drivers/net/wireless/realtek/rtlwifi/wifi.h
@@ -2806,9 +2806,6 @@ enum bt_radio_shared {
 	BT_RADIO_INDIVIDUAL = 1,
 };
 
-#define byte(x, n) ((x >> (8 * n)) & 0xff)
-
-#define packet_get_type(_packet) (EF1BYTE((_packet).octet[0]) & 0xFC)
 #define RTL_WATCH_DOG_TIME	2000
 #define rtl_dm(rtlpriv)		(&((rtlpriv)->dm))
 
@@ -2833,10 +2830,6 @@ enum bt_radio_shared {
 #define	RT_SET_PS_LEVEL(ppsc, _ps_flg)		\
 	(ppsc->cur_ps_level |= _ps_flg)
 
-#define FILL_OCTET_STRING(_os, _octet, _len)	\
-		(_os).octet = (u8 *)(_octet);		\
-		(_os).length = (_len);
-
 #define	LDPC_HT_ENABLE_RX			BIT(0)
 #define	LDPC_HT_ENABLE_TX			BIT(1)
 #define	LDPC_HT_TEST_TX_ENABLE			BIT(2)
-- 
2.43.0

