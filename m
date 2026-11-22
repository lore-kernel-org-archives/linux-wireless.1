Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371108;
	b=mSv3ZFCMuWvDdMhnmH0cyqMsgCIAbocQ8vwNkmtlhTTDYZja0tqEQPFk66+YDz5cWXUA
	 89Sl429IJ1dwxmVFCZlg7m8oO2DqIU7x+8KatGm2tkwLu3J2JqGty6WHhdrMhI/gJ1Dbe
	 +/Qp0gVUoXGq2FrxMJ08dTrd0Dg5YRMXEUbdWAPoD2J9ZB6Cj3d4+3MyyZeEeREFIBNmf
	 02e7wpUGvnZhuZlTmHM/cEfFGt7D12yj65jpRNpbEbcGG8P5EXq3WwIAHg1TU0S3Mjr/S
	 imZ2oAv/Py0BTMJhFgYFLCGXe4wJYi6hwSRBMtMSCOEKCSLMyV+Db2lWvQ31gYm8hIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BeVtOudt3OEvEUEKgjiMRbOe+We3cpRPoFjUKgGxA3o=;
	b=gkJg5/7OBHSKggnuKzbVuF2C4rRfxFz3BFYUXV98Q1ylQ5sd5VZ+CZqlBsbBD0qXBru/
	 kcLfrtxy4OJOuuWZrFcLZ3pC2y5sKUOpD1k/3eloYPa84hP+rEC990AuDeMqCTrE/Zb5k
	 Lfp4zNq/YiM7OhfjW/EMRIhw5OZQ2bQEW+fpvCwcnmPQI/dmy57Nxvi1HlJ5n3xKvr00/
	 6wHB+KtulybzZs26i52P2U654xTYIpeUrXdDgekch7e4d8ID0sz7pFdjaiwQKB2qLcLin
	 HlYGrETUEac8TsS+nK74rulqvweF+P6KlPMxVTei1ziDr0xf+cNtBarXz+8KrGJ6ysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ShK6iGtX;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB051606A699
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB051606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ShK6iGtX
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c511c0e2826so299134166b.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371106; x=1795975906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeVtOudt3OEvEUEKgjiMRbOe+We3cpRPoFjUKgGxA3o=;
        b=ShK6iGtXSiPmvcot+l2qbeJRRfK4G/z+RMo/ky2dOzglRkhYNbEAsFcXnyzpX9Gsk5
         qjx8uAxWMS8u4jsAIQ8GIT29BOnb3xCXe9n63dQO57XEhA4jpbnFzr51tdaaoVwjO7yU
         pfnY3rapwejVrp5pq2DoFTIjl4HvQvnkJ2DmYlzh188S5FgC7gfSEPc5IHGUv1Z4Q1UB
         wkKYeZRpPS+VVyzdwB9cHI4nLdvrcumiFHx7JqFw+WPRJRErjcVH+9ioAhEqnGqvwCCT
         IStl/D5UvbXfwAMD0Bk5D4+ULo5P27PvDtl9hkttrgJz87efP4bJY087xtiCrCE353PY
         uYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371106; x=1795975906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BeVtOudt3OEvEUEKgjiMRbOe+We3cpRPoFjUKgGxA3o=;
        b=pcjp9y3WyzY48fSb09tKvxPXJQs0IGQB6EKmWwF2ngKk8X3b+75JkD0hcjKhxcWprb
         F7bZPTuVfqCja+6BC3+/a8z7S5+wxFCKGKJbTQyaezEW0Ev0WEnsCGPsAeNM+W/JwxDy
         f17wwkJo+JsH8bQ5Kx/1ekq9rZVqKDEqs5LUAjNTK7pngjxabQPEZSAa2d5lG+hj+VCQ
         QspLlXAknuZuGS76PdvLqzg0OJyzWqn+xCcpuQ/G7cE0b+1ekJR//TOsEIL/ST5OvNP0
         RHj0LO1AWFcxl2Yfv6MorBhpHf7wPrXI+sOHGX36tIOEvgi9EVJPbhUIENHEua4E4UoM
         2bMQ==
X-Gm-Message-State: APuU4Z/fcjlpa63HvvbBJYUrX2vDHI4IR0Yb0KDnaivNJkC4FXwvjOgG
	2e2QFeqJ3SE411J8tNkyQDsozMffMRQXaOiOVwuJ53Ew2iFXrcO9JlRWYXtwKWW5jutCzRIJA9m
	FRmxp/bw+
X-Gm-Gg: AZFdTZfnh34JuMx81B9bJeSoMYoPfZP2jZAWv3/u23Z6LtZBiXcatti1sdoD7pWUN9w
	uhzOK4nKEySBZ29mR/IpeYkmTnk72c2mWEibA7b/vvMaAXmOndrFX2ngO4PKujvwtcmcvwu93lw
	QIwONoO4yfcHOgfWHDMMIo4GlR36kW86/LEqUQVh2MWOeFuISJKERW23rHDhb0lfQ0E/dPeacsj
	o5aTtN24Untzs0j5FQBStRwU8UcH+1HdtcrMnXbsBQ/Db+/8Act5RZsej00361G2TSPkEjuAM6E
	XMyfVl+97avUuj/lNaEYsosloy+rtlOFehOq6Q7qrFIbJCqNjFKU4B6HzfPfb0Dt8/b4d0mXsoM
	UXeQkYYBaKjVXXt5c/ffiam52P42x9IcmdzeQMwpMZqJFn2a5YkatDRl/UtrFgY1XfVnKZn+MWg
	plPiry9N7Os/oouvyX+mEv4kzTRKhbikGaPepFDH69fSxmwhDUPPI+CjnKJKKPTK2dlW9Ysmuyu
	AEv73CRp4wGLHeZZqiev2XHoPbiAHNmoEfXd3IWPBLlFagKaloh0hDP0AOiLjTpAx4AdzqsY+X/
	qW6nIx103vwU8XGWzPdjnRDpuGaiEJbyrzxI95y9qOirRD+HcOryalCpMqzR4ToV9bxlT4EFkDf
	lTY+HowdjM6nYlsBJqzt8wG+J3UCJQ+pMgwtWXF55nfUvnymSHdv+b9AtuSc5ao1X/LkEKeNL+R
	zsamwJcz6OeU7B3iqUlZtXEFLP2T1XgXGNBrcjcd2iAoA/dUTcxWsvjbGCzBfCuSQdUTJQmLi1K
	/vZ2BD47NLRdIceeNIniyhoIgJoytCHwEwiRtCAcGX4tLK7n+SkY7cEd+YbMDL97kQqZZMHio+y
	KjM5V1wVZXchLivMDZ/1mqL/EOi2+wgV89Xnbtvi90VjC2TbzsksEP7lyhjOaUmE8Y4bqqVg
X-Received: by 2002:a17:907:6091:b0:c51:51f7:c9e3 with SMTP id a640c23a62f3a-c5151f7fd77mr472909966b.34.1795371106268;
        Sun, 22 Nov 2026 10:11:46 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:45 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 3/9] wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
Date: Sun, 22 Nov 2026 19:11:39 +0100
Message-ID: <20261122181145.1015729-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
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

Nothing shows ar->dp.num_tx_pending, the MSDUs the hardware has not
completed. Print it per radio in soc_dp_stats. Divided into the pending
airtime in a station's aql file, it gives the airtime AQL charges per
MSDU.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb9..ffe1f466aefb6 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -714,6 +714,16 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&soc_stats->tx_err.misc_fail));
 
+	/* Descriptors the hardware has not completed. */
+	len += scnprintf(buf + len, size - len, "\nPending Tx MSDUs:\n");
+	for (i = 0; i < ab->num_radios; i++) {
+		struct ath11k *ar = ab->pdevs[i].ar;
+
+		if (ar)
+			len += scnprintf(buf + len, size - len, "radio%d: %d\n",
+					 i, atomic_read(&ar->dp.num_tx_pending));
+	}
+
 	len += ath11k_debugfs_dump_soc_ring_bp_stats(ab, buf + len, size - len);
 
 	if (len > size)
-- 
2.53.0

