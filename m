Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345783;
	b=IvTZOcTlLEsMAu2x84rTQRApD+mfV7Opml5Qcn4vGgbXtGThMn64JQo+fTk9s9fqwH2o
	 73LiH6xOJy379VvkUSo0ItVRPUAINgUQuwK2KYRBdlg1NYK2pTd+A8Jx1CsxDicG4gL1Q
	 3kVtZPIAL7H2Yt8b5SYIq1GJosUaNrGiV7oOLoEluj5KE5YoHsjcxBMh2lWxZCrzjVlZ3
	 Xm1QdeFc/MUWrxnvCXk1+fHA8tvnU7S1WzJn/t+KUM2f785Fj4vAHIEvCTV4ZpFswlFJn
	 OG0Nri7G80FSXLH8/Hpp457vBXAQ75eX3XeSwdCbKY84xQid7yIgXgh9cjD70TaN1kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345783;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=s2sjkD46NcJDT+xDH/ZdCg+OR/C0xaYg39VFaMApPuE=;
	b=FZBAuGahNSj0jlMsbQTc73cxRfaVGu8zjKppNcinlgcL8hd27sfPSY5Sdp/aonuhOpxB
	 t90AMmhdQTiL6Bh+b61W1NNIHUf3A7obfu342f1oA8e/SV96nETh/UrBfCoNPASK/ayBz
	 +AxIh02Bd1ZWLBDqT+mASG32h/pCpekqWefL/IsdW59azkMbMZMjy3fxzetEFOXeS0fDy
	 qnc41uhI9MHFmkcNo7MbUe+is/77dNjg5Rj81SBOwLf+gGtpXk13n1vwdLpxJxLno8DHx
	 JPijJdiF7oaiKIXHtbUcTGzJQ2WurXvrvihG7nSfiuDCYKQByNnYl3VXH9NgeJJ18hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L2EcyR/6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D584606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2EcyR/6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3588F1F000C0;
	Sun, 22 Nov 2026 11:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345782;
	bh=s2sjkD46NcJDT+xDH/ZdCg+OR/C0xaYg39VFaMApPuE=;
	h=From:Subject:Date:To:Cc;
	b=L2EcyR/6BQbQhMQAK3fmapE/EsR42+v9yn66RrsTF/7ARasFsF1H3wShKs+/KfhGZ
	 vrRSsv26t+ciftptMm8UQbYTu1IFCgr3GSWx4xrGtUhcO3QzSM+ShBE0+ahapj7lrI
	 bWEZTDHjgPS7Lxk2P+18Q1z2aLxsMI7mJJ5tT9eQg0qrpUnf7loeqIO2JuOq/dODwX
	 150b3SzcIWDjVxYvmooocD9iXustSa1Ey4qWf/Od4A5CNnNq17EicxCa3MAiRq06HJ
	 KMGMWCanSIZJedhYwOM0WQ93h6761AmP4rMqaerRcrFsMxVal7o5doCIuKiI/xTknL
	 9xntSt9XnqdQw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] wifi: mt76: add some npu missing fixes
Date: Sun, 22 Nov 2026 12:09:13 +0100
Message-Id: <20261122-mt76-npu-fixes-v1-0-8d8876b91970@kernel.org>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avIrBtIM6WuEi2ipppFJloRiHdPW
 j4+P0GkwBShFwkCPRz5dAWyEjDvk9sIeSkGVSsjpVJ4XNag8zeu/FLERutJr60ksh2UyQf6Q3m
 GMecPhEtf+2AAAAA=
X-Change-ID: 20261122-mt76-npu-fixes-344a4f51ee79
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3

Hold queue spinlock during mt76 npu napi callback.
Do not run mt76_npu_queue_cleanup() for not allocated queues.

---
Lorenzo Bianconi (2):
      wifi: mt76: npu: acquire queue lock running npu napi
      wifi: mt76: npu: do not run mt76_npu_queue_cleanup() for not allocated queues

 drivers/net/wireless/mediatek/mt76/npu.c | 45 ++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 11 deletions(-)
---
base-commit: 7ec7ce74c41551aa39e0c1d6a69c4a2c66377c32
change-id: 20261122-mt76-npu-fixes-344a4f51ee79

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>

