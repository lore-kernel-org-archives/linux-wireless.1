Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541789;
	b=NSoTEGBiCEbbaKOTpqOE3YIBAbRA+isqVXsSnpuJs3gqrg1Z6oP2HRZEtV4sgw7sqos0
	 QRYulfdT8lit1ispqsq2Hv5yrgalS0BxoG4Z0z2JLFMjOQNp3hLE2QY1mVYFAFts16Y0l
	 s28qU5GtYvxGXxbfwrW2QtLquPJKWODqdWf+hbCPWzofUV+KdCbe0+9V2aJoVncLypzgU
	 V2Un5AFxcSncT1ogNklGXsvjSBR7tn8KIWgFcZB257NMuF8FqEVzmZPDLtagTMYSnQeNp
	 TyBRWQLeQhUGbebYe/998yNBSiQYpulICi37nbliQNFN9ntzC27FRJsqH9sBN1Y/HHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wa07x68myC9FZhdDzHKBa1BRJ3R2viZjZqdPUZyNxeI=;
	b=Wbi2Ms9957MCiiBg04g1IKRVr48+B3+NQZoLhn+i+ihEwvtSfkIS47rZxXP5CEOGlVNy
	 2/NpqBbtUt/XaxVd67LGO9yU60bWjVfJq8S8ebd/17wgDF/5ofNMHvGbQURdT0JsYdeML
	 sVQc3SeuE6kPIv47+Q538k2dkmfpiT+q4f86M9ccqXM1Zh0mfIdMb2oKpK6gr6HDQRJzY
	 b2GFBXEQZ2UBr8n0YEYVMtpWgZp/DwrGZin4572MzhH+jn0PDJRDWG98nhHAV8a+omaXy
	 XbZ8Im8aGGahKOnLBhLOgNlEP+wFydmmB4zF2V4/v48Q5q44r/pFIGDv1tZlzgbBNPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdZbuflq;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD75606A329
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 17:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD75606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdZbuflq
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so27995775e9.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541788; x=1796146588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wa07x68myC9FZhdDzHKBa1BRJ3R2viZjZqdPUZyNxeI=;
        b=SdZbuflqskR8o2Ktsw9v3tRjrQC5n/Ebon7cciPObb6h6T3/YTS4vslhO7jF/2aCIZ
         BopKI9FIMLNN1tVtBDR6sWKMFRK30xYy/zrBPHRw79EVKKdnCgHxMFySHbSgn5sYTEbN
         VSdSt0c9C4iSJO4nnJuCRaorKH4ODO4pL/6Nl3fBqbqxFZ5nL6i/1OhSsgn/qCTwKeZZ
         NF3EqUukU8J2onDGY4H6AhsjEHLyLKDolSmEh+YDrKwfepvuGYmq6jOZPJWD/4YNZsII
         qV1N64jcKNdfNh7Kd1BLvYyVZiA3EpJ4eR77Gi08Er1F+RXLTEQVmdLJ8J+/n2zxHzrT
         LE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541788; x=1796146588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wa07x68myC9FZhdDzHKBa1BRJ3R2viZjZqdPUZyNxeI=;
        b=hhFeOlaE9ShS00qC4qBMFoW2hSds5TX42QlPuaPTGMowUV2b6IlYu6miTJmdECiPcg
         btxl/oLQ9Mh7BO6RuVa+VTX95PdaZLdK217v2pFGwKDvo7DzpRgmUnJDEzqUCb4bTNBK
         iXRtJfHAuaqKmuUWnJ4OZsIb3HQU2xPLNk/w/rbsVM71dM2HAu46j8NLu38UkuSmsmvz
         8IW0qW/i4D20KdDPjevar2LUV89yQ10HQ4FtmzGYrEv6F59nla9ywY2w1cRbcwBwfhxT
         /QTGESdify/Rj/npy7XEF0tMPNMojEFnRojH2vJ7EXIrolj1mHOlZ0alt+PeYXSHm4Me
         d/1w==
X-Forwarded-Encrypted: i=1; AL+hErFuMoJfQrUPXcjyUoFCUsEtffxsV3prCHLd3eYJTzez5rmxDP/5aCuqN/o6DSBiBa/GfPcLUXdXrE742uDAKQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1nB1AmXe9J8rf86M9MVBEwFOccofZcbUHphUHAkd5yNZP5o28
	ox1lzWcC8yg6q2rbzO7QAS7W+UM4+H8BX8O9F2TF27IwdQUxg2l+JcaQ66ad
X-Gm-Gg: AZFdTZfHrXIiB0YCXNQeZN1fyS5NneVp6ET77vrxJ3R4VhABCYT5wjP8teffCmFYVYD
	6OXrjYaUwWWD/12qhErafp53PDL2r2ZDuRkvaWqFjVkstQThtxV3n8qjVdM23OLKePw+NxqO1ic
	fDl2yi3dJOmYw69DEhM1regNycx9YkiuZtW18qeGJkZsFvbBQJtQ0u+WAZGAc15CSkza2LXjEcx
	+U/rpmQtGuhVp+CwGExx7w/+sVemaGHVIIUoBDQ0ESg3blBSn7CRhGmrJPZ2om/okGZ+wxbnUgN
	2YLd+mUjJGxXIQ1XnYfg0Q5C59ZTXBnMQkcOVETsgp/Bq3SnCMEUjyBG3e8N5fX+VRzMmzGZk+b
	VxPlIAllgr4vMClc1hluiuiFam6dUF5x5g8isgaZCjmTtkOzQ13AUyos/cuNj5IMzLTAxwPnPUt
	0EXLSuo3QndtsUNnsxgexZOrxbW88YyBm75TWEAwbMz8pdaZjD2/nqxCrw9O42BhDSBWaEMmS/s
	c1vqdbEHzqcbSOxzUtZqPnE1F8pN03fwY5sXZSCB46gUTskH/mfbufP//q0A2vUCyoYGAuZFy0S
	NZfZVMIGkQhsSZY=
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr294977555e9.12.1795541787619;
        Tue, 24 Nov 2026 09:36:27 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm267098675e9.1.2026.11.24.09.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:36:27 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Bing Zhao <bzhao@marvell.com>,
	Amitkumar Karwar <akarwar@marvell.com>,
	"John W . Linville" <linville@tuxdriver.com>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 1/2] wifi: mwifiex: validate ext_scan buf_size against event buffer length
Date: Tue, 24 Nov 2026 17:36:16 +0000
Message-ID: <20261124173617.802875-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124173617.802875-1-tristmd@gmail.com>
References: <20261124173617.802875-1-tristmd@gmail.com>
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

mwifiex_handle_event_ext_scan_report() uses the firmware-provided
buf_size to determine how much scan response data to parse, but never
checks it against the actual event buffer length. A firmware response
with an inflated buf_size causes reads past the event buffer.

Add a check that the declared buf_size plus the event header does not
exceed the event skb length before parsing scan results.

Fixes: 21f58d200388 ("mwifiex: implement extended scan feature")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index bdd4b8465863b..77f55a3f9b450 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2631,6 +2631,15 @@ int mwifiex_handle_event_ext_scan_report(struct mwifiex_private *priv,
 	u8 *scan_resp = buf + sizeof(struct mwifiex_event_scan_result);
 	u16 scan_resp_size = le16_to_cpu(event_scan->buf_size);
 
+	if (sizeof(struct mwifiex_event_scan_result) + scan_resp_size >
+	    adapter->event_skb->len) {
+		mwifiex_dbg(adapter, ERROR,
+			    "EXT_SCAN: buf_size %u exceeds event length %u\n",
+			    scan_resp_size, adapter->event_skb->len);
+		ret = -1;
+		goto check_next_scan;
+	}
+
 	if (num_of_set > MWIFIEX_MAX_AP) {
 		mwifiex_dbg(adapter, ERROR,
 			    "EXT_SCAN: Invalid number of AP returned (%d)!!\n",
-- 
2.47.3

