Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132499;
	b=YSX02ONTuVOUv4L1Qy5moGOCwxUPG1u3pXaKJABogNjCkXqAOgr8qs7mGNIvevCGN6in
	 ka520c2MOW0jZNantNOgQriZF4ks7sOHE1zFhzKfEcRjTqidDSERiVBnlDzYd7c2YQqj9
	 86kDALpYPpCZ8bV++zsfaV89K/EXxw0SklKgq5NLgGCFVrlN22tm8r78gJaleNx5BGpDJ
	 EUS+Nwiw7oZuY59WxKHSf2O6ZJKKIWzEo9Rheo9S96TBH9VBbSXt1PYJvjfDa8CgKMNYc
	 rPmn78X1S8fxYV+ARDOKoVWBSVs8FHiLDXw8mBN9bVZ/0tLKsN3s58lYLWHqqsobCeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=vpKYq578G04A3WM0cJAbU/S0OPZrYtevhMMdamxq/+U=;
	b=ITD9LDWGlyQn/teItXsSA3OLpeOVNjZEUioNIeQPVOhn6APIiZ3cYISZa7K+dzezgLTe
	 zhiNWP1O9Hfwywi5tvC9OOpm8lvoCbe0xeQh1ip1mBGV1ADCtXu+ibKBho/KTnyOPZINL
	 h8xZ1sE73qoFf8F4fZ2hqI1RplItqyfKqTUMRWP9uFIPRc2iefrIzrCIGTpUkQMQTLtPJ
	 gLomxiaHc0dEbGeBdS19mnggH+NJELieHQ8y8dTLnGWiLe62Isr0WHTTbbM56HEUQ6Pdi
	 yF4tO3MzA8AUX5dhe0Aj8+8XIE2v4BHxNeSqWv5QtVQVyKmtzxRvY32dsiwHvJiey2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Hym66DEA;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837B0606A32A
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 23:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837B0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Hym66DEA
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so156966a12.2
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 15:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795132499; x=1795737299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vpKYq578G04A3WM0cJAbU/S0OPZrYtevhMMdamxq/+U=;
        b=Hym66DEAciaXFZ66cS0Tt0ahcKQ8XfnTn/0NB0TpPgyLF49Sg6Eh9L4jh8BKsMeb9a
         PDq8oS40pDOG7ABwA+kntERnIkVvuDxv7s92M/04USQiISi6FhSlcQAybQuYYySmmvI3
         zkMj2dcwJeKJwyNoGJbiF2zLD6Y90FScEOoE2SlPBXpYsM2fD1nnTZ+9SwpRsswyFhek
         6LDC0DHPz0XYaPuaXyUK4IYfAddyIMVkvdTHm9IfZNtc8Y7Jg0hgefK64C4hSKtpRq69
         VM7yBytDkltGFrCnMudo1e4zmSdVTEisW4IHOV/hkslvnoXOZofdRa9CyRdffw1lEm7M
         6Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132499; x=1795737299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpKYq578G04A3WM0cJAbU/S0OPZrYtevhMMdamxq/+U=;
        b=c+rPueFtGHNXM+wt1ptksLa2DAwCm8IwU3p2r8mV31hAlyxh0/pM3Iw3/gDeHc974J
         IHaq/WJ1wwE0N1LwqoWPd92WLXKaS/Su9fbEEL34YhXfy7ntxwL6IMvU/0EtypXwUVSi
         X5OmYu5pIFJ9w8UjBr8/mc8j3cjaNRw6rcI3yO8LVNXXvMLmQDpsbyUmCwZYDjmb1eNT
         4sk+g9+xav2ZDHwGwTMJ1enNxiRaAQM36bEXlF01zQmolSqWstLVQBQOtwamB1oUkZFb
         bvKR2AWIq81V8F+vRNP+rdBm5YZqptZAz2SA3SwfI/Q+pSxwB7w8+UBYxCK0RmDY1oht
         A75A==
X-Gm-Message-State: APuU4Z+/enJYvas9qH8RtM45Q1/TCNhJHeuGlFhOVwz5xqGDyoq05SzQ
	SFWXEUQ2LvbLAa+nc/pDzd2+WmsvAsFAPAUMM7n6nseaK3iEkRUBuXniDV5RHIY2I+0=
X-Gm-Gg: AZFdTZcOCg1QlPrS7B3ijHTFzIrDl+7CKll7bgz0Qb7ep2q36LH4jD3Yu/2BvgbmKrX
	EMrTG0CthEj7UiFiejshDDF8qWNQWg9wsXlWrtuD8qRJ0or66UH6lTXFvMJQY8pPYcXGjF5ff67
	hbmOzVt0ByW1z7bbOhHgSZ9Res8gEN4cCTJPDaQhnpxcFtK1kyrtM98dAJSfiEBfl51qgahOm6N
	tF+7gK/XQRy27+IrEps9JG1+BhaZOrsVXx/0Os7Da68VwqLyhfe8WypWEm0TEDdgSshkZlAouKB
	gK2VE1oKbyyevKUHNHildnVwmshfL5/pQ/+RGJAr918BqYI/B+WBxX8hgbLc3Cc9hkGOu49K/qY
	Vtis6zfFAes9EILMY7d8aKHQ5ScCHJzwpdysfpDM811HKUT1Ty0PGVaT4QObkDkjY7SmeIbbZSx
	mFy/NNlgcK57Ma7EYYLcb6MZx9WvOkeFsLMDr5e8BUc9228ES/ycrGDBnrjB6W9ZX0K8e86wfR3
	5KB+lgBt+58xxpVCPTog/zHkn24fS7LKAPFhfxA0bnK8TXGoaog07E1Myu6tQ3fRHfwnH7Bfoyx
	kUOVfUSrcPbEIC9clYgZWmuA4ruTXH16DLEjyo9i+9mW5/4Hvk3yYozpfzz0ATpDlxzz+pRjCSp
	4ovqoiAn0lvH/e1iTBsH+EpnCxA==
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr840758a91.7.1795132498753;
        Thu, 19 Nov 2026 15:54:58 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm4530371a91.16.2026.11.19.15.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:54:58 -0800 (PST)
Date: Fri, 20 Nov 2026 10:54:55 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Heyang Tan <thy15333007817@163.com>
Cc: linux-wireless@vger.kernel.org, dan.callaghan@morsemicro.com, 
	arien.judge@morsemicro.com, johannes@sipsolutions.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mm81x: validate external host table TLV lengths
Message-ID: <irtdtr2khzxurndd6ukvjus47vyfz2b7jnpqfuywurn6ibyhwr@sualwdk2hzmr>
References: <20261101141025.694-1-thy15333007817@163.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101141025.694-1-thy15333007817@163.com>

On Sun, Nov 01, 2026 at 10:10:25PM +0800, Heyang Tan wrote:
> mm81x_fw_parse_ext_host_tbl() uses the length stored in the external host
> table payload as the TLV walk boundary.  The buffer is allocated using a
> different length read from a device register, and the two values are not
> cross-checked.  A device can report a small register length so that the
> driver allocates a small buffer, while the payload length field claims a
> larger size and makes the walk read beyond the allocation.
> 
> Each branch also dereferences a complete fixed-size structure while only
> the start of the TLV header has been bounds-checked.  A truncated trailing
> TLV can therefore make the capabilities, checksum, or YAPS parser read
> past the allocated buffer.
> 
> Pass the allocation length out of mm81x_fw_read_ext_host_table() and clamp
> the payload length to it.  Require a complete TLV header before reading it
> and verify that the full structure is present before dispatching it.
> 
> A KASAN reproducer mirroring the TLV walk reports a slab-out-of-bounds
> with a small allocation and an oversized payload length.  The same input
> does not report after these checks are applied.

There's already an existing patchset fixing this [1], please check
before sending patches.

[1] https://lore.kernel.org/linux-wireless/20260812060740.1275280-1-lilinmao@kylinos.cn/T/#t

pw-bot: rejected
