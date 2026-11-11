Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384398;
	b=XnTrhwl7oBgWNV0po81nAUVbMLZ4eg4sPA4m9HZK/ZwFGs7pUfpmxPrrgWBgqUV35jms
	 BEtMfTn58OYNEirQojQQI6cqZBLG0+jPNrD6hrwvDe8QOSJb9JkuK5/cz728GXyms99s2
	 jlRYhYcVfIPpVAvSm5aYFOj1ZvV++5CoR9D5ib+h+nvACm/JZuXSUIrRXDVleFN0l6VSu
	 au9Wy1wW0fIrfs9Wo/FBnFIquup7ve/80uzpkmnXo/qTfqaDtQChQ4UzAcwoSnrdR0gDI
	 yFq8Vl2ixBeikSsYVXH4mlaIUgzwmaRLL8xbrimDUC/E/xIT1lRG1PYfTbec9fc7/1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=;
	b=u75+ExSYPqVpvUCEc95N6X0KBqiftdAfZIUgglry8lI5zKm5wvVJOilnXZAqrnjNAVAl
	 Dxf/MYCvecG6C/ounJIGeN3q/YgRGaJgYEOaHuXxWyWCL3f+/PYK3SkABOmE2AfieWhpG
	 kDRivGmEt6LS8Np7W2Fjyy1tuUNLxRFodlX/3BQgq2pIu5ErvmgLLaE8qdzwZEWoXi7u/
	 E/sxXqaFZe0i3DNfNI9NhYzyUXncQzkyQ4QAR/oOb0Y2gMh+rxRyXm4gMlNi3FxsIby17
	 pfZMwTzN6L8AcRHSoJLkJpTQQo5gnnCYkS1W9438rYgG1ZuYOd/XL19Wbg6LhlyHhJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gacpxWE9;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53DA60A6F63
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 08:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53DA60A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gacpxWE9
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so4187092a12.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384396; x=1794989196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=;
        b=gacpxWE9WxZOwiWnKoLF6LJ7DhjMhXDCXTqv4CdbCFctA7Tg2HZucpZPc/vwNZv9jR
         FSZYkFWf32Zf3DqADqJQh1r/wnr+UsrgAyo+TZy9IBM73JImieNt2dtqHX8KA5RM2adD
         3uEIVIV5VNfdGoYx/oBkMJVoC3SJOCpdjk/5f64xjSa4vm3qssEed2ROGcAgNIAll3TB
         5cyCpqtgQNsQPFR6QXBSXJhoEeee0YFFHEMH9QATMdPgr+OZSTzX51FqG1YKfBZ7zuKR
         75BknnVTz+CIPLaweKs5YCQo7x3mPnfe0cY+h4CNJcrC4CJB3y/0rWNXQIjSbTy5DfWx
         4QTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384396; x=1794989196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=;
        b=21f+GF/ir77ONKxQ5LfmohCOt7F3IBa3yXtgfrKzwC5PR1iSZRiCF/lUhyNZqe38tU
         JBUm/FUeRRehEr2/keXTj8zgETLKfeq6SEiG7M3TN0lBOoJGFKZZsJ8bSkxTPssU/Yzl
         o2GWjKDcqp9UC3xdlBsqmPMekue3pUTtnLCy3xF00+IiUfwP9fpcqA1B/hdv4GXAmuAk
         QCOiDp+1Nsw99VjpEv9ls9Edw/+THWHb/nr2mm7bmhrMiLVOygxaTANqfQWZcwGHQfEX
         //Ua+g8on+wuIMmkdP0FAaLhjatojoQaxfW6yrGpkeQSJHr7qS7A5pybwff8kZasndMN
         q1ew==
X-Forwarded-Encrypted: i=1; AL+hErEaXnJ5lmzan9Pk//J85+0zFq+qKTmr98CeaWTD93VLo1b/ymNgAOkwpeqesuOurglCHgiYOaSzY6VzXDZpEA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/vkCgpUNgqsQ5Rxlac9BdC7a/clMQ2bZPuj9qdJU6QccvCvwFm
	JP1fcS1hCBUm1OZtxcFNcSo+y0tRGqNQqRVG+nNsJ/hVDkx8kCRcrnlxblFY9u5bhA==
X-Gm-Gg: AYBFou0zx54dqE/xk6CyDvrXy4P81qLXAJTW+itN5VvACGUMJWDGuwH67pc2zgZnM0g
	BVFaSVWY0+1z9S5EPriPHQQcC9iP8VunrAGujZO7BgcPUHO5ruBPR7XcuSEoPTznxZI7rdwWY1J
	cEShnYl3n6/lHVrezT9zllY9iWQLHu4o6VUi7JnCnLjA8jkCC+LtzWyIfOQtj9w1EeS6Ufq+tT9
	XJXcsIdaF3PtmXTjbleeJlRMo1435eDekbvb+hgMEy9BcksXp7YNC6VwtkIjTKRd7YTAFcp1TsR
	b0iuRoR99gsLmuh7BHIuA6LkGOlCjTVtr2/MygYBdAsPiJHtV+OhhDnasCE3I86TCixL0+SLBFf
	PW1uh4+JN/y3r/zyF4JUoFp+tbzoX7TxDjkDpsA9eGebueiJzPTBOo+W0XzKugNL9Ld4Xi7VIbe
	eTv/8nRq/vFIER7634SaePfYsiI8FlMIaefTb2bCJOgzSU7U5SubQSj990duu1qznob2is7Wxre
	H1n3hDCJQ9N2av8ApArtAyr0xtpg4y4kCEu2aSTDCj2ZYScW5QAyZ/EN0MwrG0qpU4/JDYvhGBB
	s521YIFauApkO8SQBKT5o7KXff4tId/+MOtM2D9YgJFUJ4DahTEh0ORbw6GnF1V7WovwzlukRiL
	NzrTkXVCdo6n50qXY3qV+WeorjwczM0tVBry7EMIXCB12H+bDLT2+xCQywRRBUNFXNZJL0gJEBA
	S+fSy87ecXE5009RxZEH/gcsqSG34+q5Pkg646NM5Zk55AUdulW4+VvMdaMQPUyLb8kFEBV0Ois
	8uWxavHBzvcGlzrIUJbSJGttjupOzjjklT4WPyqhNTOOTkobMb15KKfNIQMSi4Spkv+dYRhd9G3
	h5+EzWFmv85nrKaQZRUsl8EkOkHcZf8qC+2Nx8F7
X-Received: by 2002:a17:907:d311:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c5066b54812mr120674466b.18.1794384396170;
        Wed, 11 Nov 2026 00:06:36 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:35 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] wifi: ath12k: ignore WLFW servers on the local node
Date: Wed, 11 Nov 2026 09:06:30 +0100
Message-ID: <20261111080630.244427-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080630.244427-1-julius@bairaktaris.de>
References: <20261111080630.244427-1-julius@bairaktaris.de>
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

Any local process can publish a server for the WLFW service through the
QRTR name service, which records it on the local node.
ath12k_qmi_ops_new_server() connects to every server the lookup reports
and starts the QMI handshake with it, so that process takes the place of
the firmware, including the REQUEST_MEM indication whose handler frees
the DMA memory that the running firmware writes into.

The WLFW service is provided by the firmware on a remote QRTR node.
Ignore servers on the local node.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d2..ca1d8720a4830 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3994,6 +3994,10 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct sockaddr_qrtr *sq = &qmi->sq;
 	int ret;
 
+	/* WLFW is served by the firmware, never by the local node */
+	if (service->node == qmi_hdl->sq.sq_node)
+		return -EINVAL;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;
-- 
2.53.0

