Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059452;
	b=PQ9CXTafaRwiKkD2T/EWbNF5r90lssCr8KGLbQAYJE9bCkjsrf7lSZkvUSX/U8fcRja/
	 HBfB67TRBeWion80kf2REk6PjxoXONDlV74Yoh6eC9y4tV8nkb+Q6h6bze9GjQ/87otVJ
	 r5Gc+87AllXy4naMEzS8qa13DJT7LVQKrsiadUkRFGNTvdAlh1K1/3mIaeaLmuh7OxeKP
	 n+eQiKsrFPf7s7pDD2iiIEzv8a81AzbAiZDMP4yi7/RzQUXk/TcC4fhTKFLFjxtXrsfox
	 RFxq6sVKoOSgLfGO5ZUkMZzK4AFQtRw4KAoaNzzlLZx1IZYsfqDWUtA29yeYYA+mNMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=t+BvgmTQl1zTo5EqV52B0itc8Z0S0F4G1wzUEK6ITJU=;
	b=EXOuSPVgLE/v1NZ5l/uNvkYSzS6knG+EO27KM9xENOd+p+tb6yh0Gkh4vYlxje6dsBbz
	 qflHZaAkUUmqP/c5AQJ30laVtavU78Ol1Y+jXTwbi8HeoOwvDgC/NGMnNftKOge7n98iY
	 v20SyHimvCz9/l/J9Ob0LbnXe1a31FiGZsbjRNeBjo83ZMnyCyCVCSzxt2IvxNAv9Qnm1
	 Ysarwek+rI2wMbEpdeOCH+hh1H85GZoIFhlAzexjDQCFKextBrmu4609uKAD7hlZKHTEm
	 uzd8N+02KRsDb9WMqfrtTW0g0U6bWoe6tZ4qIzgbYNLn1lqNwLUMK+6ATrBD9B3W7Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJSUQs1a;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319BB606A330
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 13:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 319BB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJSUQs1a
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so331028eec.0
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 05:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059451; x=1794664251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+BvgmTQl1zTo5EqV52B0itc8Z0S0F4G1wzUEK6ITJU=;
        b=zJSUQs1apFryTHeFGNPhbE8vS2fP6g4G5hrLi+BTx+FHU2cOiqinAvLVA+YcXDWSNs
         oeGRfnIdM5/pleBD/qVlz9XveLJIvmoaTxSpwpoiJ5AtJOAqWdOOauBEPT8N3EMfglPf
         uffAwvpJRIPKhp1a91qNDXqdu7928DOEVvpZBXDo0oZn9oh0tu57fybb+hCPoLIjj+oK
         9ZhifP/Brh4hoGOOYXYkjA8V8lN6gCgscuYPmqyy5Xw3eNWQRJMktCknO1J22iiH7PSe
         ZJfn7snBPKqKaflSycYz2U3d5WeUy52p8ReAdOZffUKgxMe8dcVZQS/1NgrMMcAIpnPt
         6iGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059451; x=1794664251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+BvgmTQl1zTo5EqV52B0itc8Z0S0F4G1wzUEK6ITJU=;
        b=iu7EwAzwypQXLywnpS/XJouOCQZ7ZsdhxsrLGrFgYoQo4U3pt42oBuw3nZ1ul9Qx4c
         9LrBpfgi8IUFEKkveY/UsKCS+UpGJXJR447PTEgPPXNHiu0Q4xDW12kU64kUEjoz97Ps
         vW1gkzrPgzlRohe1RsKQlJ6MKhBMtoeB32Xxz+bttRbTNHf2ms/+r4djLo+CVepmFp/H
         TLfpBcHloclVCOrZkoyyAs2UTh+/hP6fAJn6eUOn1hbNwGxnLOCocohuTduaGQqQnNT1
         Mu5oCC/WT8pY5laokOcVCPjp1AkwKkrloNGQvFUprxC7yVnMry0UA/uS0DbXTmaNIS0L
         LFew==
X-Gm-Message-State: APuU4Z9YDXsuzKU7hFjs3dFhXp2t+LjF0lxIAS6v1VC9Nkbw/EIiB0oA
	M3Hv0aOVcDSdVQVfo8I7KnGeLv07D0bFCZsDRT1NT3HsNEL9VksjKabNCgbKiL5Z
X-Gm-Gg: AYBFou2RsKJlj2Cnoo9vFSQGbjbE90m4fM/NGgXYyZArUTBNADonpYFVZuxSqvy4uEm
	6as5eTLiYuLlGRCh2DSr6ce9Tji61FMWUduTH0roLhLgH//+ubr9S30AtxWkK5SiP2mIiLXHEA/
	sr+uXrbyD+tEZ+Nzr8Dg6/7COLn9Sm95DbZtGRrVZNRWwrn5UcLojYTk/EprdezO0SfC0u52dSU
	dxVtCEBHZNZorArTnpki3E2JKah78XJ7Ip3UP0UWxaWdt4N9FRSDzMKXEs/8733JX+VtPIFepNl
	GrPVCr4nmhwPMePDIasG07JWZNPun1t81A+gl9MiLIJt79kjRG6gBRjmyciio18Nv1NzoxNgpLm
	iz07NcVgOeVMqE3ekglUSWmZgSQNITCj2scB7QZ6DtWPmhzHKd2MNflkjwWn3DfbDgEE47tJ+zN
	J927LGpa+nxJBDJfUBFRHoY3yGJZhnIm9NR3/0KZLjcdesLmDiQFTmS5iL0/j0mvV5toJWHugew
	pASUxqvjZQyJvT1x0LDZpbWRUVoQTibhDrEM0UOaGtfty3JT5FiwtlSHiwWROfrCEzewhwWg643
	pRsX0ZnOhH6SiqGM5RhnzSN+sGy3lhZaCkrAw7TmeJINzEyPlUhD32yBWKyyrSK89jeStjc=
X-Received: by 2002:a05:693c:66cc:20b0:351:2958:1740 with SMTP id 5a478bee46e88-36f778f4a83mr7688087eec.37.1794059450625;
        Sat, 07 Nov 2026 05:50:50 -0800 (PST)
Received: from KRHW1CJW23 ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa999654sm14878430eec.27.2026.11.07.05.50.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 05:50:50 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Benjamin Berg <benjamin.berg@intel.com>,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH wireless] wifi: wil6210: restore the GTK as a group key after recovery
Date: Sat,  7 Nov 2026 21:50:30 +0800
Message-ID: <20261107135030.10329-1-enderaoelyther@gmail.com>
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

AP recovery fails to reinstall the saved GTK because the key-type
conversion changed the former false pairwise argument into
NL80211_KEYTYPE_PAIRWISE. With no peer address, the pairwise path finds
no station and returns -EINVAL, or, if the AP advertises FT, sends the
GTK to the firmware as a pairwise key.

Pass NL80211_KEYTYPE_GROUP so AP recovery selects WMI_KEY_USE_TX_GROUP and
reinstalls the saved group key through wmi_add_cipher_key().

AI assistance was used.

Fixes: 3191dfbf0779 ("wifi: cfg80211: add Control Integrity Protocol (CIP) APIs")
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Compile-tested only; no new W=1 GCC/Clang, sparse or smatch warnings.

 drivers/net/wireless/ath/wil6210/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wil6210/cfg80211.c b/drivers/net/wireless/ath/wil6210/cfg80211.c
index bf060281c9a2..2563073b4766 100644
--- a/drivers/net/wireless/ath/wil6210/cfg80211.c
+++ b/drivers/net/wireless/ath/wil6210/cfg80211.c
@@ -2075,7 +2075,7 @@ void wil_cfg80211_ap_recovery(struct wil6210_priv *wil)
 		key_params.seq_len = IEEE80211_GCMP_PN_LEN;
 		rc = wil_cfg80211_add_key(wiphy, vif_to_wdev(vif), -1,
 					  vif->gtk_index,
-					  NL80211_KEYTYPE_PAIRWISE,
+					  NL80211_KEYTYPE_GROUP,
 					  NULL, &key_params);
 		if (rc)
 			wil_err(wil, "vif %d recovery add key failed (%d)\n",

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0

