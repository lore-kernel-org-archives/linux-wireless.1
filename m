Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302467;
	b=kYL9cRERUmyPd7o+0hsRmkA66Q5qQ+5EVSZEKDB2ft5IyF1m4ykDwEuCn6nVmC+I8C4Z
	 In7XivsMaLsmVY9HhD2xg+9LCcZuY40snNKF8p4qRWf/gIhEVw9+Fcf9/296vmUV3OQAO
	 DghG66bpl1+FmKM0FFIsInXyScKQyia5c0lfX4b7kFATxr4R3IxO0fsQHmgjD91ouAFU7
	 dOfhjuNTnyYjuywFVM6180DKTMLeVWXLuTCR5QWIQsjJQZaPtUFpuNzb0qB4x5vzDFYXH
	 jashT4q7SO7bsrC2yAbPveO7XOuSCpmcwLk/lUXD+mwA6aX+LQSyH4SHge6ZMeTaiCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6btR2aaFXry8/+OvCG761RoKG42Ek6YtGx/y9HYL3Ck=;
	b=kv8aqfcsDLr09ZvrYIEOkgzN+UA0NDexH/8qkT6dl5Y5MFrq/7S51PfpGF1YdeNBJ9Ak
	 ZMoLNcsoUInL13vJHj14GrV94ZEKxJmfhY/IGHkBcFtxljtPQ101uuj64FzW7EyycWgKN
	 mMYpPxCwpj8gWoCnY3mttbj+Je0XUIVu0VyjE1H/T7hSja96wpBw5h+PX8BYCdmG6cPcX
	 WBzg7+9R5N3n2U30TkTgLRZboLqp632IPV3Gwa8B/mPcIflMNyS8bziq4m16Gyoc1TdjC
	 CahSGgqdtN5U45oeW4tbBPnh5dtRbiXWkmO2uw0leVGdYUBjSMZSDn5IG0hZuZjUV3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HVjAoiGm;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B560A261F
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D6B560A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HVjAoiGm
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c511cdd5a82so245951366b.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302466; x=1795907266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6btR2aaFXry8/+OvCG761RoKG42Ek6YtGx/y9HYL3Ck=;
        b=HVjAoiGmKzeE58aE4rLmdcQ/r4u75DFDxLTKLE054NvRD91UQDoWR3Pc5gR+is2KIa
         D6oh0FYI2e5QMZYOYn2AakT269LA8bNEYuLZ4ffcTfDsKvOtbQTCDC4o0LwczQ958b1I
         5uMi1gDDnMdV2AzsLMmGdYDxWp75IWZoTcWQNRVIloP/7or1u3IOSErK+aeSVw8LAeeY
         PRnA5h4LY4EjaGnGN1fD+IibMcXBFlJL6VEEplQspXY3FYClObVGgeSRQDSSId6r0/Xx
         GP+E6ZRWE5owkMPpND4PsJImNhbVcixE/YmfRTFdsEN+Ip+6zYXBCSCd1TiAWdEMlU+v
         jHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302466; x=1795907266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6btR2aaFXry8/+OvCG761RoKG42Ek6YtGx/y9HYL3Ck=;
        b=w447L7My7CnivHjf7dU6CQcXT+1NGiNppPPPlRsKEzHmoAURvhYUxgDL3MNeS2b8IC
         P8szzgKTGGLWv22kLLcPZIZUYQ3hdgQa6RCk5WGMqxwn/hjLNQcoEiO+eFarf5KFvF77
         QaFua/brpcK0HGZn1FVKgD+vAumwnMggQS4NbVj/kBAe+xl/CniQNWK1oez+PXWDJC+n
         xgzGjqDLVbWVTY7MXZf/uxAUdyFIpuIGdwOtLGMdTpx5gyZw0gRZmlD3tq0oFgQ0pxFa
         M64zYJ4MPfIa30tpM4MuPhzo+vEu5oFi1eWfzrEI32xVAitPnSnGZTtsBhF8NYVICsf+
         AclA==
X-Forwarded-Encrypted: i=1; AL+hErGlTg3D/1TDotCXySDZ3OEU5QIY1WTY+irqRIYHLg3YXo1uedjnIK9JFbPIb5Wl1ECH8rOcO0B/ZFsgHKyfUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/P8V7SfqPeznK0hzs/PkLeDvVk7J9P33PtcvkyGA4OL5FiqzZH
	v0dLWZnYR6kM0w+N8cUgZPZedXkT63HgAMld0mGtYWjblAJmfeVTC36tnMOcsBpTfg==
X-Gm-Gg: AZFdTZfXCeKx24rW4qBXEhOB4rfBR5Xdos4SguLa6Mq1zw3iDqKyukXbL6VzthxZlAv
	qVSml0Pco2+yzZkekPJA0pKnCSBadG2oaPUY24Tf+X0d2osDMlJjp/uHeNlA7lm2hweb79pWz38
	cbSVSVR5aPw4LjAH0kpqpbtjbd80AfbhqLReWqEaJM5TyY/F4KP/conDHIpvxINNPWCX00J+jBX
	tW10JQ3mG7ALy4kUG6ITvjvVq7JdJh71/Tuo78FIarY+pjHJ8QhBaqUqrvdzPDvvsRN4HmPp++d
	grtoPjKLAZHJj5+BYw+y/4gEkIzqA1U6nZM3mbfGTEEAuXR6vdOIyDV0XDTB1P6G7R2buKd/XkD
	AsPD7pQrKNj7yRrHA7XVbR9tGImupnFCsU3lRFPgY8mRluhLESv9WLMjDuRNu7+rx6jlgbBtPAT
	lcTYN6Gfjs/xgWx8dQNxl3iXS0rLFHFDLJGGFTGtDf5vbrynMvrYyPdHa5hGQWO2zWHTN1xJu42
	G64/+WN/Z4im2khtLiLl+I4EGLp55nhPbjDtuMjqmRfja2aPUIq6RuOXSUwO9VMhIHozCJhOtA+
	zrBQCAHhT970wgNv7EwcKgfwXRnuYQWO4c7JH6mUNDs/67VUFABCAd2n/b2VbDe6PU+lR3c8ucF
	e2qKUCUMI0f67Hgc9kBq0VhZ2OMGLCTflFcm3WiTP8xzMuDHZRvs2W7gesOTxnnnlhU6VBI5sl0
	VOFO6CNtP5xBSMRFDvdi520pI57vAx1TZ0Bv+5cQPpWSyI0BOIfoCbSd3dyUwc2yDjfSQQqC4gS
	SVet1XPhTAczTDwPPDR5kZ2GCtUm7MiyldYqsnXoepJDAmmXzXlwNB3MVa7squw82D1h48XelEh
	nHLdAOWXu9RbD/CGXMvoxQuv/WKy6980aDyhQhp2fntvNst7aexWn19/dWycEpJfRwm55yP0jW0
	=
X-Received: by 2002:a17:906:694f:b0:c50:ff1c:22be with SMTP id a640c23a62f3a-c513aace676mr469413066b.16.1795302465698;
        Sat, 21 Nov 2026 15:07:45 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:44 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 07/13] wifi: ath11k: depend on RPMSG instead of selecting it
Date: Sun, 22 Nov 2026 00:07:25 +0100
Message-ID: <20261121230731.1206043-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
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

From: Florian Maurer <fmaurer@disroot.org>

Commit 32ec8488d75d ("wifi: ath11k: fix sporadic WLAN initialization
failures") made ATH11K_AHB select RPMSG, QRTR and QRTR_SMD. Selecting
RPMSG makes it impossible for ATH11K_AHB to depend on
QCOM_RPROC_COMMON, which is needed to use the remoteproc SSR notifier
when ath11k_ahb is built in. Adding that dependency gives a recursive
dependency error:

  symbol RPMSG is selected by ATH11K_AHB
  symbol ATH11K_AHB depends on QCOM_RPROC_COMMON
  symbol QCOM_RPROC_COMMON is selected by QCOM_Q6V5_ADSP
  symbol QCOM_Q6V5_ADSP depends on QCOM_SYSMON
  symbol QCOM_SYSMON depends on RPMSG

RPMSG has no prompt and is selected by the rpmsg bus drivers (GLINK,
SMD, virtio). ath11k_ahb needs one of these transports anyway, so it
can depend on RPMSG like QRTR_SMD and QCOM_SYSMON do. QRTR and QRTR_SMD
are still selected.

Signed-off-by: Florian Maurer <fmaurer@disroot.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new in this series, from Florian Maurer's series [1], unchanged.
[1] https://lore.kernel.org/r/cover.1793531790.git.fmaurer@disroot.org

 drivers/net/wireless/ath/ath11k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 99f625b82fe1..2b608d4ed263 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -13,7 +13,7 @@ config ATH11K_AHB
 	tristate "Atheros ath11k AHB support"
 	depends on ATH11K
 	depends on REMOTEPROC
-	select RPMSG
+	depends on RPMSG
 	select QRTR
 	select QRTR_SMD
 	help
-- 
2.53.0

