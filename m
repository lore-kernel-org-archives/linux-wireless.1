Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082683;
	b=KR2f9rDcqvZ1lvqqSewL8Yrq8XyFEM1HREHXqOM6f1pC5ORevO0hCvugojqcdcS6iPmd
	 HOxPsigWo0pQ4sjkGcgyTcu7N6l7ebA20FZ4jXPxnO0SmI+yIA6p9v8x+XEZ5BnxjyWAA
	 5wLvA29sClF2fzhtX25FyQqryMhpYq6IsAHt6p5Er/lN5gSBKEdqZkBX52p3KhCwJnUBx
	 d8ix1BzcSmTdyMhlV2l4bt/25j0sQMr7INMgVmhb6jbGWVsrxtlIrrBHWy42eYTkIX72c
	 en1hMSHWHaj4s1U6y/yNKjTTraYKPPhl+ye48M3dwP8mF1W85VyAQeiQ/1jsI93GvqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082683;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JJGLYPHzddrv19l+Wt/RsAOZQA+9iUUhc2s8/QuRBZA=;
	b=xDHWAHAsirLiz1sEAcaXt/4qlE8+eiX4Q8HOU8g/DSjwQI62I7s4tXSeBkrJzaObXtXJ
	 0VUgksKw9DDB6fBUl8Gjm9BLRSegbswLv2iDfT3n+k07ZSTb7TudpwRRg0tu+V44HWEZi
	 a1Glf76EyM+7+NHirRP8lCyEuE9K5yDqJ1Gkz2e5BfYfeDFbGn0QylG5LLmqsgK2Vzk+J
	 jKmN9URYxSV269m4CSPsP/YN5sGxzB0P4EW4YsoaTM/E8Stm+sYxu1kbl+Bxc2TjLpXjP
	 QP0kNguEdIs+58BWoNtUYnXNrgb1eCQXE5Vx5LuCYzN8x1vQ3Aw6IW++w0X5jbJf8yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=bIJ0EY4+;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8094E606A324
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 10:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8094E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=bIJ0EY4+
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1B39D80BE4;
	Thu, 19 Nov 2026 11:04:41 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwzlICTmi4r9; Thu, 19 Nov 2026 11:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1795082680; bh=JJGLYPHzddrv19l+Wt/RsAOZQA+9iUUhc2s8/QuRBZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bIJ0EY4+XIAASk4SLBZy8dy4H/Ry3xo38MZDSvT1Hjo+i6dgyDZ7X7IhTqXwCOKoH
	 YrFGvCEgNBraIpbpIgRxgzWxIy3GMH3c0BZ4C2Q+3w96UAZsnaqMTD+W+RMgApCifj
	 ZvDXByOjb1sFXMFsqARxOv6jEpuEugcgN7PrwOM+il3aZch17EFmgmGg6wyvnF5zdD
	 UBs4YBQoT4F6dGWe0lgV908l/D10QgzZrnYISC7vdQzOdAvJJP1SB0J0llXxm6bbjL
	 OrqdWjfH1nEMlTshteWqyqQ6AwborlBTis2moIYGxrwkf/MqADB9x9202G7atQjYo5
	 htrkMgUkkGnvQ==
From: Florian Maurer <fmaurer@disroot.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Florian Maurer <fmaurer@disroot.org>,
	Felix Fietkau <nbd@nbd.name>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: npu: fix RX packet reassembly across NAPI polls
Date: Thu, 19 Nov 2026 10:04:20 +0000
Message-ID: <20261119100421.1963265-1-fmaurer@disroot.org>
In-Reply-To: <20261117-mt76-npu-fixes-v1-1-11bf744747f2@kernel.org>
References: <20261117-mt76-npu-fixes-v1-1-11bf744747f2@kernel.org>
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

On Tue, Nov 17, 2026 at 02:43:46PM +0100, Lorenzo Bianconi wrote:
> Tested-by: Florian Maurer <fmaurer@disroot.org>

Thanks for posting. I ran the posted patch on mt76 467ae2e3
(W1700K, kernel 6.18.55) for another hour of iperf3.
There are no oops, no page_pool warning, no refill or skb failure.

Tested-by: Florian Maurer <fmaurer@disroot.org>

The missing rx slots from my mail of Nov 16 are still there (232 frames
without LAST on their last slot, 7 unreadable tx-free events), but that
is not caused by this patch. I will send the [BUG] report separately.

Thanks,
Florian
