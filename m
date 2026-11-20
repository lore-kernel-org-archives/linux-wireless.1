Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795159414;
	b=W94mnJ/5W7hJO1usRWn/drHw94cWG39Vjec65+C28elnMapeMcjix4k+csQmLiPhZNf6
	 q04N/4Sq63pzLEadstBz5dOemmcArSWtc7sumys/ro5qLCC16doLrI8jNQA0RCk3+9XfO
	 DoO7wnf1Cka28DG+fQvOwk6W2GJypAMkfic0TPZ70OtaVkrWm4uGMc5oN7WyegCeR0R5b
	 lI3H/u6lJfzsTjjYpSYbE1i1Vhj/KFR304plxFKtpsmd3VflaYJBUJnT4MNGO/H59gBUg
	 09XYkUgqk31/LbQVAiekTUUl+E16i+DVGq7AxD5ecllrkPy8cogV+V9l9BLlymo91kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=;
	b=BfCCv9gIWaT6x06m+4yPQ88dL5gNuf96ELCbvEnJHOsZ96w8n5We5WNXgI47dHPVb7HC
	 hrG84z6OKxIZuXudJr4cnnSem+QbKYww6HiVKSG7RAekxgP4cnNseCc+QMKnjInyPjxXy
	 ilcISzmE0oJtfUr40ap54R9sZc3ApgD4ulolVfeBYrE+bROaI+4pKMSgqEjtTm6cPs4N5
	 FF0BJCa9JQptpheAz5LW43hs34DNI4Zbnn0LPEqspllb9Hkt/F2zjvrPuDdd1FmQngayu
	 pLh52Cd/W3eKrhriBHHEO8JW7aouXcI4eTDlVK3rtyvFtjslIE93giVeRkGgu4X/W8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0Z2a3k4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F77606A325
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 07:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F77606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0Z2a3k4
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-498f5fa5103so271266f8f.2
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 23:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795159413; cv=none;
        d=google.com; s=arc-20260327;
        b=CYPdl2xN5Ci4nxwbHQbngyjJsqsjFWqQjvMxq4j2ELzUDaTe32cFd7/PLTwLIofHkU
         M14LcSpVWpUTwbTPHN3shMDiad4hJCTJDBLk7ukdeOHNYEVmo6SGIfKve0kR9azmz5iJ
         7NMWEOO2xyX5WfOQprh4TpGoeoIQUz1pQ8k30E5Hg9AI3AlkOFixZRMHRbPiXGnXNM3L
         fkYistZ5gTCnIQDl8HfgeBN6gIRhalLhdeZaz3aRvQb+rA2CzXFI/iWt2QAbAJCjhJoH
         ktl8ik/8a5BpXgt/qxxjEZwjZMme2oZ9D+Rgzbm/pluT4EP3rEObND6ppCAc+cr9AQFQ
         oP8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=;
        fh=fOyuiisQD+dqWdzPBk8JrDgETJ00t4YkoWf3STHISXU=;
        b=pQBCn+jKkVt3oglCcQ2NqhC8YEUyGx6/rfUXjeDdczWsUrh56jKidSGLxmqQkXQa6H
         SHiT2hY8Cpx5P4rJL197f90DO8Dc8LK5eNymKxedOduD+s6bGiXC+jS1d4ivsnYBwzYS
         kU54qW3vMW9A6x6MzNvMvKOLIQoiaWiV947DK/zX0XnsuIFpUyyB1UYEsDMcZdwLF/R9
         Ikqyhe+sXXBz6pPjyIuXnK7czEo+5nQPyPhlolItE126jYIFWn511/dR5b9LFPa9rfTC
         iwMg0Z1y9k9EVsoQi2frBCWlAak/9W9UhTbXymkJazdJD80zS9pZsOoQNbyrHQmjv7hl
         GhGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795159413; x=1795764213; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=;
        b=C0Z2a3k4h9LGR5OCECjXLMezJNKkzAAyjBN6mS26BgF0GZamujoIU8xhVlsorWEPCF
         jDMeCNrmbUxmZLDFW1Emi9PI0jP/y90t4PwrXqwrwvq8Td4n0mK/dMxTOmSvZqhpUSzZ
         CMan7JvHXLPvAlGubdfhqt6RvN31/Fgt+nUseWYQ76RbvUb7Njf7MirILJ7gNjLAHeZ+
         OzxSy+wrY+yzTH3Bpu4HzrW/2tYB36XJKJnfqcmZRAhLWwyWnzowWTcFE4sLrOLYfWv7
         N+GtzES1pHOypKwF0NL4s4YNPrJr60exo2MceoFl5jzZ+wX9Dv+fzDJXW9zft/2rqoQT
         88Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795159413; x=1795764213;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=;
        b=G+m2NbbzcVFhQFaSlynpYCNt8jNgg9AnozHjqt8exHNP+vfkXGQTHC7pPY+btmGi/R
         hThvPSXWW82/MRXDNmi6yESBZM3rG7d3lbz+gSKWmrnyuMX7X1Gi1z2vuS+dIkOzN5oD
         xBBtNBfaaWU1+TpasiKoMTh4v6ZfLPjaiBxcNF3JCy1rgoSyC7POR/kfLBXnySoQ/YIh
         SF7xEQ/UbEe1p68T/lZj7ULJCoUg4QqHzUT5sV4l8iNXKmXTu6WNO1AzwZ6HGuweESHu
         rhAcFFr4k8A128Z2ANK0SrIpivIa6XorPWeafXKUiX2VyWpo9BH6umghVLjBgrto4Xcy
         ntYQ==
X-Forwarded-Encrypted: i=1; AL+hErFgaWUfEkkdI3RTY4QEMRaZcxF4fJK2a9T++UzaoUXzTGhEaa92Z58oi2iyHmSA4FzGPjprR78+b9mgtnXm3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/mtigsQWOIOm3/ximdATHN3Ac23Xl41ohKZrFy4TtcVxp/Alq3
	7FijC8uu2yaTcV72cbadfwe0nNU44D4eRKHym4pqKnC8Dq6ttdWqEW9MbOgzOq5MOfZ7Xu26x4R
	Nkc8g7qhjzjYLZmybIjBdetgjYSVcgwc=
X-Gm-Gg: AZFdTZexGtZ2T55YKDmfVndl39v+YqfMN+yGFkyWuoMfBGjV+9qZgj1dWhb47SCEqn3
	cVbp6eUZXzOP7tpyTyFO8EzRzQSWaduW69xbmwbDS70QO0h9RThnYpHuEUtn1FG864q03KebolA
	Il9wEpQ298AKHUihjcPtPm+yQUhpi7blmhY4iFigPkjKuOBUQ3FNRDgn3HMs6HNewl/ViVJfSt2
	VWPgit9XSk7zwUX05RCIgMsOs7OIJxRI3nL/aBcDh0H82qPz6RhEncp66cgw7dwvAm1PZyZzK6B
	iu6KGvTE6eM1KLr8HM3j5hwMlKuxsMwVCkqyMB3kV/IjRyfn1NZWIOzSkHqJhEDtfKZ39fzzE5o
	WjOYQwobTqMHsKaMVCuackT9D1jVQrgSZC153rBZ0afSSqikQHCqzl/SYaQ==
X-Received: by 2002:a5d:5888:0:b0:490:a481:7ac8 with SMTP id
 ffacd0b85a97d-4abb532ea79mr3553673f8f.29.1795159412630; Thu, 19 Nov 2026
 23:23:32 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119124928.1398520-1-maoyixie.tju@gmail.com> <av8osemFMD6C2EdK@lore-qca>
In-Reply-To: <av8osemFMD6C2EdK@lore-qca>
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Fri, 20 Nov 2026 15:23:21 +0800
X-Gm-Features: Aa3M54qvLIAoTLXhSwpuxxRmvv68nNUsPxUUak29GDrjI45vtYhuyOcNNPOYrRw
Message-ID: <CAHPEe=FFgzM3L9aiBNczg2AQ4JiG-p+eFKLemjrOMzekuBmHpg@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: sdio: check the RX packet length in mt76s_rx_run_queue()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Thu, Nov 19, 2026 at 05:49:53PM +0100, Lorenzo Bianconi wrote:
> I do not think this patch is correct since we actually consume just len -
> MT_SKB_HEAD_LEN bytes at most, right? I guess we should add something similar
> to the patch below, what do you think?

Thanks for looking at this.

The fragment is len - MT_SKB_HEAD_LEN bytes, yes. But
mt76s_build_rx_skb() first copies up to MT_SKB_HEAD_LEN bytes from buf
into the skb head, so a frame still needs all len bytes between buf and
end.

> +     if (data_len > len && data_len - len > buf_len)
> +             return NULL;

The caller passes buf_len = round_up(data_len + 4, 4), so this check
never triggers. With it applied, my harness still reports the same
reads past the buffer.

Also, rx_check() runs before mt76s_build_rx_skb(). For a TXS frame,
mt7921_rx_check() and mt7615_rx_check() walk the records up to
rxd + len / 4, which a check in mt76s_build_rx_skb() cannot cover.

So I think we should keep the check before rx_check(), as in this
patch. Frames that fit are not affected, and the loop already ends at
a frame that does not fit.

Thanks,
Maoyi
