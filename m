Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553569;
	b=ZVPq70qoC26mAA85rtkzH050JW2Aa/relNaLQBf9i/ytw/JnhRWRQuMkEBVgrp+ni5bU
	 TfNj0cHhhX06tRtincEYpmrG3Imaa6iFryCNRS5T0s75hxCvKJa2qmrzQJuOkmvindSBg
	 8j1oEjmRFrUx3pbuKktoZ3OWiVV1ph9TUaz8z7yHI75xaRNqUvpe8zaMT54uQLzZXIK0o
	 gkedVM2WqfIG13RzAtJS377FP93GtJr3+I0OhM+woTor64rhX9+bn5/o0ZuZjTPwbN0FC
	 HG4pzFJd4b2LR08zX+GzoX7o23T/QEeBeXuSS7EhHrMOTVhx84CdSOkRDWV0nS85rbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cpj2nfOgvWRfKTYAM5ppDFk5nmLpw5QMBkhfGZsFWC4=;
	b=QkY72iBkeXukf3BNRm20Wz5xMqJiCPXyt/fUuj/A9k4KHJ2+n2W+QF5HboovIJogEb18
	 AFnKO/UdU4mB3feLN0OUAtZpEYrbh3MZ3e30X0tFBaqggsxxOeuDsu3qB6emU8XIkUD7k
	 +gIDdUc8DkwTp939WHMvFokeKf4cnmVzXfNVCE8JSa0dZj874ivm7OgvOrfpPPgUYu1jq
	 gMt3BrBSZtg5tTnvWO0l/X4+LSzsFlVMcjhblQ77NkPletX0o51LbSwZ/lsxzecVQykyf
	 N0n6el6frpt4tlt3C8n0dLaaTNaATu+4fGl7uC4QelIJfd1o+vqfKOm233ini8t0osg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3FdHBBY;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05600606A339
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05600606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3FdHBBY
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so40349785e9.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795553567; x=1796158367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cpj2nfOgvWRfKTYAM5ppDFk5nmLpw5QMBkhfGZsFWC4=;
        b=A3FdHBBYQCtqltBpR0SUmc0Dwo+82qN4Dm2kSsCbhq1vyxVkqL4Tm82yj8ir9Goxzr
         hR/bVX4pqU7NReMiwTbPc6Ak8l6qyLh1G0YQvpisdH9xmOYXjz8vxwCVGTP1GJup0RAR
         od1V84iKS6AZO2at1zTZdtnzTi7wAjiP6i/1e/rGBg/j7VzyhdutCNGHprjKq8+qifSD
         XPZeskalqG1xm877qQnq0R4l4XZwuVS7v/f826uzFkhAxpkodHljdMaqL8DZjqxbFWRX
         WKWlb8PJaYTUXwPq0LkYJmgKhaHYv8sber325VgHr05y1vz2xIbjGPZs+TpcQ90Rs2Vq
         bSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553567; x=1796158367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cpj2nfOgvWRfKTYAM5ppDFk5nmLpw5QMBkhfGZsFWC4=;
        b=Vz1nCI0/O+oHw2bLo25WPonp7Z/bwkpUeZpPjjK6V35RYpVZ1uUhNycUMJeJDhkeLM
         0ElqH4/3gQL/gc8f4BnrrAmzkIaD9MDZXJlMLYm4gVRAM2F4VfJFRP/aQOYdySrdT7d+
         wzYkoOPNibbuNLLRWwC6b6klK44ytjV7RLGvMSVXupnrEb98jbZtRidDhV8fTlTaHAIp
         QISEPnotyHtDheVPsVx54TnjekggCt3JcjqS2tffewMYCkTVfCkJJw4E7XblreTzEBzi
         uxxoB7LlXr4Nvjj7PPd6iMHPh6IlNTdcf7UVYE4vCySpZXNd9mmAsv+KF/AH2Glmyoqc
         DWRQ==
X-Forwarded-Encrypted: i=1; AL+hErHtZsz6D5JqnQ05alL81NHZZENUMxVpWEAK1D2qDaQ59H+slHMZH8ZS8qnFK4rQpxoWp/LoZ1JYPGJQzu+Lhw==@vger.kernel.org
X-Gm-Message-State: APuU4Z99IE5QRgnTYqPgrBFBZxkv3MBai3Fx24s06krtnN4qQO6h9Vq7
	hpyk79i0710swwSjKfMAJ/oTcefYftsKzdouuxZs+InLgQh2BiJY2dg=
X-Gm-Gg: AZFdTZddHov/m8XKK9LiqRZffBvl+V/mitpUSs0pChdBEjXV5qFDnrTccdTHtci1P8W
	S0896cMOPbYQLOLL4zVZVwXwAvE9EaQDWDzBIYAxV5luTWyqg0KmHYh6SLDrFCZAklys8pMhDKD
	eBoEaceybA/g3fPboQnCOhOD8wrKE6klDVhKa1oAkn+vqb0Wifc9eyTxJR8Fj6VbCW2/hgMyNjA
	1YtZeJ/vtTQd62dWOslwjjU8wHlSDWtyKyKPXtnKHLlCmFImMnICLeGdro/676shIr5v5EW8NH3
	MruGN4EF1N88EW6eXoPdDPZ4MPNUIsMEHWmUD92wfobuAIdK31ALh0qTaiBCix+E82cvaGn/esw
	8RUCVMUkJwtQrCm50azYIQk8LU+jjTorkY0XTI7c9966of10DBKK7e015+s0/xnyfGq4WTvR8t+
	z0WqFFfzfS9g8nNdevzVQVi8eORcYGqox1Fv0Ql6AyvI1WhgnoNIBeFnzZh5UPKd5blZBcxE+26
	wNsdyO9xLlhSeSJXVkgAuvr7Uzq2KJ4bMB1KM5BX5YRDQnqfJawHPUlBb/uj9jYIG17bPeKB//y
	d54MAHVYGeqqU7Y=
X-Received: by 2002:a05:600c:1d04:b0:4bb:685e:cc42 with SMTP id 5b1f17b1804b1-4bb88817e4emr334447225e9.18.1795553567186;
        Tue, 24 Nov 2026 12:52:47 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm666149315e9.13.2026.11.24.12.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:52:46 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Jeff Chen <jeff.chen_1@nxp.com>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless] wifi: mwifiex: validate scan response TLV sizes before indexed access
Date: Tue, 24 Nov 2026 20:52:38 +0000
Message-ID: <20261124205238.3531413-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

The scan response handler indexes into TSF and channel-band TLV arrays
using a loop counter derived from the number of BSS entries, but never
checks whether the TLV data is large enough. A firmware response with
fewer TLV entries than BSS entries leads to reads past the TLV buffer.

Add bounds checks that verify each indexed access falls within the
TLV data length before dereferencing. Initialize chan_band to NULL and
fw_tsf to zero at the start of each iteration so that a short TLV does
not leave stale values from the previous BSS entry. Gate the
neighbor-discovery branch on chan_band being non-NULL to prevent
dereferencing an uninitialized pointer when the bounds check rejects
the current entry.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Cc: stable@vger.kernel.org
Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
v2: no code changes, add Reviewed-by

Build tested: x86_64 defconfig + CONFIG_MWIFIEX=m, gcc 14.2, W=1, 0 warnings.

 drivers/net/wireless/marvell/mwifiex/scan.c | 23 ++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index bdd4b8465863b..4c4bbd4b3b73b 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2208,6 +2208,8 @@ int mwifiex_ret_802_11_scan(struct mwifiex_private *priv,
 	}
 
 	for (idx = 0; idx < scan_rsp->number_of_sets && bytes_left; idx++) {
+		chan_band = NULL;
+		fw_tsf = 0;
 		/*
 		 * If the TSF TLV was appended to the scan results, save this
 		 * entry's TSF value in the fw_tsf field. It is the firmware's
@@ -2215,17 +2217,28 @@ int mwifiex_ret_802_11_scan(struct mwifiex_private *priv,
 		 * received.
 		 */
 		if (tsf_tlv)
-			memcpy(&fw_tsf, &tsf_tlv->tsf_data[idx * TSF_DATA_SIZE],
-			       sizeof(fw_tsf));
+			if ((idx + 1) * TSF_DATA_SIZE <=
+			    le16_to_cpu(tsf_tlv->header.len))
+				memcpy(&fw_tsf,
+				       &tsf_tlv->tsf_data[idx *
+							  TSF_DATA_SIZE],
+				       sizeof(fw_tsf));
 
 		if (chan_band_tlv) {
-			chan_band = &chan_band_tlv->chan_band_param[idx];
-			radio_type = &chan_band->radio_type;
+			if ((idx + 1) * sizeof(*chan_band) <=
+			    le16_to_cpu(chan_band_tlv->header.len)) {
+				chan_band =
+					&chan_band_tlv->chan_band_param[idx];
+				radio_type = &chan_band->radio_type;
+			} else {
+				chan_band = NULL;
+				radio_type = NULL;
+			}
 		} else {
 			radio_type = NULL;
 		}
 
-		if (chan_band_tlv && adapter->nd_info) {
+		if (chan_band && chan_band_tlv && adapter->nd_info) {
 			adapter->nd_info->matches[idx] =
 				kzalloc(sizeof(*pmatch) + sizeof(u32),
 					GFP_ATOMIC);
-- 
2.47.3

