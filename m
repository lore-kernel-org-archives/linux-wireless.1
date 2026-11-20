Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205379;
	b=DCDPMssf0QEJrssOu8JK5IbpvO51zNHOJqgiLp9CZMW3idvbVh2Nm9Q8PAqjRVE+LTAa
	 SHWhN49z2NtKzAS13Sl0WSNTbISDAXLsnd2VFOnkqI7eyIZZHHt1PAGwZ5Fg/NPmK31Gi
	 2EfQIxRig/ZIq9zt40ERKIy8HTtnH3nQHKY49LQ2d2x0rKn1nFpRNQFZ0UdY2Em+iuItn
	 ED+Ol+CtHcVKJ2i+g8OwHr2KPlENEiphUNYEIAzFaJbsK9DSGxHjn+c4zIpomk30VKbGg
	 3GhratdY3pJQ2eK7QXBt62+BZtBPuG7iXv6bC5VGg9kRaWsv/glAW2OBCqjKzwjejwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0vblFSre3MiOJ1U1d0ar++bbAIQ+Yx+HItU4giCjIDQ=;
	b=vSF4BAu683s824CpnVRZ5h3rqYu+yOZL4tcQrQXFnF2RW519kRRI1t4a5uk1HYVw4hrf
	 9qwtikw4MwzPsVQjRF6tyuMeCZa49OqpCI6MAd/DnIrpDz74kVbg8tl03Ka6oJJKLusJG
	 crRamCIDXEkDSPUW6Z3ryPBFqj26f43xhuSW35PRmPSy2/eMxbHIAqL5gUCvfRIhIm04O
	 bWruXQSvHdT7wkjeJctbDWdqhqqOik7r5s4syn2k12GCeXjQvurSg99Z8cZAOCpdxHu4/
	 cfrQYEer1FPQPyILZt7CrdueBjQyZK5Apvr3Ynp5ySo4UV1A/E7sy7ERFcEDILdDSbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQNKJgNb;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F664606A6C1
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 20:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F664606A6C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQNKJgNb
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so1166683f8f.2
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 12:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205377; x=1795810177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0vblFSre3MiOJ1U1d0ar++bbAIQ+Yx+HItU4giCjIDQ=;
        b=nQNKJgNbi5WNjZLZZ3ynpZRwNGTPUS+Yun1AMIQCdwkIKF3lX27zriptMSbfAF7hmz
         ESMHhJhtMC1dKOVASGJJfPza4MLeQkPDvM/Ql6gx0eD8vK9MwdmMkeqi5LNyc6Fej6CU
         FZLXCcSvBkQHGmgF8npPM4EoRJ7Skri59uaQUk496pncWdmoNd4JaDEFdRQPl7eKPDQi
         rpPGRGJpWUQ5YUSJrGCjlXBy60GCHXpwpPMpWM05jEWsF2I1z2caCpKIkFx6Vobjx57/
         AvdykvH1NSZ/2HP3/m3VthTpvU/yrREdUcEY4xV7t/Pcq0m2QwAmMosE1jG/42fFs6w9
         qffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205377; x=1795810177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vblFSre3MiOJ1U1d0ar++bbAIQ+Yx+HItU4giCjIDQ=;
        b=gp/1t3FrbIgvw2Snw617fcol0OeDBdkZwa09ore9b/pqdPwAtVp/31J2I6Vf5Qr4vT
         yyZSewSVIKuhV0gsvYSYhL8/yMwsx2u0FIy75o+ooHOEiW/YGrOmSylVMhkbbBouY/SE
         tffT939ZizjOjhkin59vxWZMcDlCQYQKN8cIqXSpO5pddmSaIuTt6iVBxvpGzEotOVHa
         qZpRUyn+49L0Qe1N6ajeu74V+7Db4mvLBcjfTmxNnCHAkAu+ycaBnWenKMsWrNvEBujN
         MysMIY8N7EgJrBy8qPvdZX2kuHrNNSLak71qPaQB8+17Khlw+Z2ZsOGC0+PLvRR16uO1
         6asQ==
X-Gm-Message-State: APuU4Z8PmgYvXvGATB78ORkfv7hoDq7SVxObcGg8zNmfNS/mY+4qhWmp
	ZGVYXNUP/JC7cxTMNHB9Ok0DvrZOtAAPLTCLYY4Qh+8058Ce1Ir59c6N
X-Gm-Gg: AZFdTZetTXI8Qb29PlPoYSwtAlvCdSU+hAINu/s8DCW/R8/idMF/NKiR3eOGnIW2uoE
	XjGDODmOMF4A5i+6GKJzPtVXYvskpnvVBCYNZI4DxYpBCRe7HInnE9nZ0ngRKurdAydrxCcTedl
	7i4xJ1Xd0T0e1Mb4Vlvx/2XGESqSgkAOhK038+QMpOFHH3gdGedM/G6zZn1n7H0r5DuvU7ZtHVf
	4i/PmKLDTu02IUOQD1gyNZbmz/YrKdbr0p5zDDUeVkdzmzC76SBsFPGOwfxzjPTpbYlTjVWOhP7
	t/Yew8WBrYhJAcq9YPUD9awBxMixxb7na6X1luOVL7t+tO7nJGTvC17sHyb33eBYCaBJ2jNmDCs
	CtjLT8VO99gzry9nrrm7LzLfih1EniIBNegw8HpZlFa/dAxJGmHeW9IiIUDv4EXXNgb8u6+gcNy
	tauwEh0wVJiSCGy95Wk/ulNa7ITWe5N2+/SNq0w892/9dG1TO5q5gAJcvhmnNeq1ehvuRbeeNvX
	VhdJlavTXL91bZz1q96V/sEdm1ks5P6iQg/IqfxQm0+CsQEU2By6DHppizS7ScRH/0DDVcLp0fF
	1ZQJriRsvqtxlYqduuL2mmRRQNsTm/cHBP8RXgdJXuHjZrMYC7M=
X-Received: by 2002:a5d:5d03:0:b0:492:cd78:7137 with SMTP id ffacd0b85a97d-4abaa9764d3mr9017536f8f.8.1795205376952;
        Fri, 20 Nov 2026 12:09:36 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm7869233f8f.33.2026.11.20.12.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:09:36 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH] wifi: ath11k: use the NFA765 firmware on the ASUS Vivobook S16 S3607QA
Date: Fri, 20 Nov 2026 21:09:34 +0100
Message-ID: <20261120200940.81577-1-ingo.kubbilun@gmail.com>
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

The ASUS Vivobook S 16 S3607QA carries a WCN6855 hw2.1 NFA765 module
(Windows board data: bdwlan_wcn685x_2p1_nfa765a_AS_SA_S3607QA.elf).
With the default WCN6855 hw2.1 firmware the target crashes right after
the board data download; the NFA765 build from linux-firmware
(ath11k/WCN6855/hw2.1/nfa765/) works.

Add the machine to the usecase firmware table, replacing the deprecated
firmware-name property in the device tree.

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f4..37e443a18d31 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1049,6 +1049,7 @@ static const struct __ath11k_core_usecase_firmware_table {
 	const char *compatible;
 	const char *firmware_name;
 } ath11k_core_usecase_firmware_table[] = {
+	{ ATH11K_HW_WCN6855_HW21, "asus,vivobook-s16-s3607qa", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,hamoa-iot-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,lemans-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,monaco-evk", "nfa765"},

base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
prerequisite-patch-id: ae6c33cce4db2472b5aa360b5e6cbf29763cfd69
prerequisite-patch-id: 85373c0c0ff98ec4cda496c612feffd19f715d52
prerequisite-patch-id: d752bf7c6f8768fa3d4d39387455c3d4551a8481
prerequisite-patch-id: 56220a324770319f2420a2b114db8fd8c0c6b7e9
prerequisite-patch-id: 78692cb7c49dbb17552ec082f147c878aaf38761
-- 
2.47.3

