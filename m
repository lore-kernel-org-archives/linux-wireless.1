Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384395;
	b=eu7NST6wkV41GFm64I/zsjlDGsQPh6p5ZavEksD2l2ixPbhJ2JdGuM5SCYldpMgDeReT
	 td3V+BT8JLVCwBR0rd9iVxA4l096ZL1S+pHt4NLBZ9nL5uEbKmwchJWw8aDZGV/oflhx7
	 nuSjwWHg7Z99XeY6KV7HnkEnH29V1PbZJYXcvaOgYNk4rwzyXmdUhwJ8seQx/79nhfvYk
	 IOYqsbdNJ1fv6eMpCAad9/R8JRAgB6gHkxmgInxZY7x6lleqTMMnK7A4HaBqPx7fX3j5w
	 /Vw7tYj20u8x0xfudA0GzpQo/i6xo2IqUQiEXMybDTLwU/J2cpEVXWmrwVfDqSKtFDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
	b=nqh8LHuqpSOnBcCqKg/GGk8VpgYktPxjE9KemU5D9+GnQPZhCTLQL7qqQABka086hjWj
	 X46KFkaD70dUFwbgLi0ZfFUHLbr0spuDgUrkeArhCCq4BrL8tpT+SU/VSwKcNxn4RUNEg
	 3+b8l5b2XSLHw79vrZoGba949ZlSmLCQhWCajNuXwQV93Ze1VDAKwWJ2+m1HJa6BI79MJ
	 gJEVtrB3kC1gbZdLFGA0YFdwVUlCTXAMZxm9W+JiWiiHFhpKfwbXTxCwC4e45qyMvgFcN
	 T5lMtbAnH2/1mw325ovkiLIOr23L1Wlu5JI76JTMetcxQ8KRe+6k7GJLRvCXf+kkNqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Nk8QewPw;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC6060A2604
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 08:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AC6060A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Nk8QewPw
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so3942905a12.2
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 00:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384393; x=1794989193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
        b=Nk8QewPwJwIWwCBkJQkwqLqUH0F4hfEadYxImwylvX9zqSPh44IE7kbONs4f4Fpp5m
         JI/W38VEG4J65NyhxM5i6PbvVHFzMJOb3NanD56JoJvDNBcnMWqddIRaiH+FHyB1PVtL
         0F0AmnCpTaBuiMs3x2bDROMmqpc/MYRUaWKyZxPjYS7OJ1rQrqPlZ1EMxfwcqbbTfhKH
         D9j/SwJU5UqJ47fWKWJofTmjLd7LIbkszXYv0YH7+fMaMWF1Pi474yOonq1R4YYvV2Nz
         IaGhyl78AF/CcPTJd+q9rasm4R7lHQ5qS9CwTqNYY+udRdL0WB4A0Teg+gyI71vg3GqE
         V2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384393; x=1794989193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
        b=JqOzIreJasGHBofYdIlQg0tNWxRIS5SZh+Y3jwhTq/IcI9zu01Gag8qxqECS3iI5/i
         W4+kHKQzNo2E61a/PIQ3fNwOUbeSiJF/0nbBTDfg4QGyekb1/wWneTyK/PUECV7SHo2w
         MxslAHouzk4RGTbGcLQI7gifpRaa1KimpFKnvCGTEDM62r7UUFAeWQxQU0Uro4S/xuxA
         Nctjg2R2vQQN0Iy1b7NNq0GXgzZIWi96tkxYQUbJM67B5dkTxnSoyzeH1EKKVaMDW+OW
         wB6nQNMIoxRluKBDCooHfEyT3l47bSULZY7/moVnn3MZXafatNminPxTUnpMO1Dmbfgy
         l2gA==
X-Forwarded-Encrypted: i=1; AL+hErF4za8Zzn+To03lfUDZ920csyLzU8dx2kJDo5tM47dXB7a9w+7rQOU8jS+45eNlc6LLhEdjk5bfjoBUjSUDog==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xessK6sN6dfiBY+CN4fus6tQDeKGgy3/MEnD9AyRnfBDiUfYl
	A/qEgb89Y93+xMrfA4m0IIs0rfujKNwWhisq4Ixj3XLI4/muQYa6rqy+OYatiN+nJg==
X-Gm-Gg: AYBFou0L/b9Bme1EgR/n+KZBiHUMnGrQBMH1O70ynqjPrYSJ5bfNf7fgn1qvm0hgoYx
	3auPjkHZWn1I90acH5d9OD81f/eIhVM7+Bl16KckTUDR/G+8Ah7XcGwhg0cW0IXrfH0z97rPOMi
	ygPDfmDWC1uEcQTpJ+qxneOtxYPbaYNi8K33mMiWGv6V9TG3KHmYiA+uHiWDKuMkam7uUKdxroJ
	7+HsO85MJ89U1rCRmmsF5futjSpJM/sVJEsmAMGfPPNyv/+7VwL3lbDjhtP5uWdAA3wDaUWoSWZ
	Ch3fcb1Q3aEeavfXEtV2KPFkM27bsbb5OGpYx44AITsWYqw56fxc+meFr6X5ORyLlmh6GXGS1y9
	7A2Aw+oIyBkPcNk1oy/f6RjSJfCu9zAyksN7LkzKxX3G/61MRcFj1A5oqZowHtK5HE5HbRKig4H
	3zPrSKjHt3TwnBbVNU0jr7rbpF6oJ1QPd66uizQhVMSILTNJ93zHyDCxCYci7g7V4KDbEe7uX5S
	OwS8F+I14Dk7Yn+SysU27vUS2xVlPMLDqcVEgnvNoliigxBCuuRO5J/bbbkc/AIRKBXjVJiIQ/3
	67usMeeTNq5zlndSGjnOLpMTdYRYdQbalodr3InaIQKOF4UUuIC1UmFVastRK8S3BWNq+Y+xyqT
	0ytcNCaOrbElhV0XjE6ymGH29ZUGZZY9UgI1vJADYX/xXRQAslDR28kpDnAV7fz3p6lRa3bCAMK
	AzBVZJ9w5ddeppg3Ogg6PA+EC7Yvgmm+Ala63+3BVzPjhFEbYtkN222vxGQ3Y1RSiwjc9L0O2oa
	9qhfVajWMcfhkE4HANpG/q6rg1ynIhVRiyMVb1BYDPu+KZQAUjgxA9RD4MOC4LfbsgsDDHowq3q
	/wRH39ZxSKOvOkpukPA=
X-Received: by 2002:a17:906:f59c:b0:c44:16ad:c31d with SMTP id a640c23a62f3a-c50668b84bemr120721666b.4.1794384393506;
        Wed, 11 Nov 2026 00:06:33 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:32 -0800 (PST)
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
Subject: [PATCH 0/3] soc: qcom: qmi, ath11k, ath12k: take WLFW messages only from the firmware
Date: Wed, 11 Nov 2026 09:06:27 +0100
Message-ID: <20261111080630.244427-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

Any local process can open an AF_QIPCRTR socket, send datagrams to the
port of a kernel QMI client and publish a server through the QRTR name
service. The QMI helpers hand responses and indications to a client's
handlers whatever their sender, and ath11k and ath12k connect to any
WLFW server that a lookup reports, including one on the local node.
Both paths reach the REQUEST_MEM indication handlers, which free the DMA
memory that the running firmware writes into.

Patch 1 makes the QMI helpers take responses and indications only from
the servers a client looked up. Patches 2 and 3 make ath11k and ath12k
ignore WLFW servers on the local node, as the firmware serves WLFW from
its own node. Patch 1 does not depend on 2 and 3, which can go through
the ath tree.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (3):
  soc: qcom: qmi: Take responses and indications only from looked-up
    servers
  wifi: ath11k: ignore WLFW servers on the local node
  wifi: ath12k: ignore WLFW servers on the local node

 drivers/net/wireless/ath/ath11k/qmi.c |  4 ++++
 drivers/net/wireless/ath/ath12k/qmi.c |  4 ++++
 drivers/soc/qcom/qmi_interface.c      | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.53.0

