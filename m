Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477051;
	b=aRMIsREIn9g34lI8Ow/jPZu52ES9DRLsAkljBru44NT5XnbUgnhCn0Gv7JHfmX++ix5y
	 9zveBaMgjZGDBEDhvobLWFsGpkMxfngGrQ1d7YV6QlmOKnexPzQIHvKziNauxe/4hnVkf
	 MMZWSKZLWJEksPiNEbJ3FOTeu5Fitbt0ulGumkYJsWySqkNnHxOeJ6S1eVp3swbqjoPqF
	 fBQawONbMZl7KfO3MXnj6i6DtTyphi/EtCVSARtgIFBxFvoGnSBgFvx4UWGzQtRavhpoe
	 cK16HBe33eY+gL1Z4Q8/CVzlWOBH9bRX69mKlrngGEGFp8EPphSX2yw5MpEBaDcjtJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nCtOThlgIxlSduoLEYBHryFj9jT/Zq+67s7VxNMjkzk=;
	b=nLV9NT3uZmJ3CpkaWjw2QBtlB6i8NPNVtOWlVUJg2Oa4dW0zZfiQ4wFVu6CJlt4nJ9yh
	 ZuA0UcMiUtcd+hKy89YQV4r5QYIJI1PXEL0M+pBf3eLITkPbN2GQYn/Jgxhlxe+09JCrX
	 1LqQavetHNc/uKRxhs1a18CXa95rhZgDjGIUvCh/O2a+foAuw2cJ5c35zO9XkCzJCNYdn
	 AmfMI69+2RX9mxJZPxN5ihIcCrjLhZy/u6RwGd1TNKfz6M3KZsYVgz6in2FF6TDqYaJr7
	 VeiJF4MrEI6NZqnhWYG65mQ+wYT62RjyYPjhKRwZx5EJNK+dx8IGQjrZsw54JKWe8Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NHlkL+qI;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF61D606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 23:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF61D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NHlkL+qI
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so2559302a91.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795477050; x=1796081850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nCtOThlgIxlSduoLEYBHryFj9jT/Zq+67s7VxNMjkzk=;
        b=NHlkL+qIwXD8b1pC0f90rQnXIGTuE42Rd17hMdouo0VjxooaoGPJLXqj0mPM0dP0Uu
         UQObb7iUBTm89PIsssTqdgIOZ5nIUzluWbEryuNEf4D03NOA9bUWJd4MdbihzEew2kM4
         6qhFFyZxo3kz+fppgYOVZL/e0pxhA4LTdmp7TiWGdz7n/kr9g1fckW/XKLmovydGoPdx
         jMNPDET4E4xfYQou6PQSQxVfL7hapvjtVavUM+vn3nqjzoVzQlPO3HFe+OlTB2nzZ22P
         zPwGgHq0Xb/aSmdc6cP7GJd8MUE8hEmg1Yr/jE17BwVQhXLhmkYzVi5n4d62GyvcEl9Q
         anaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477050; x=1796081850;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCtOThlgIxlSduoLEYBHryFj9jT/Zq+67s7VxNMjkzk=;
        b=zK/bncWifSyf1gHNAg+tjxiUiQIAL494Tc3dwsJ2ZAZd5XyQ62OK/bxVyyEhCRnBzE
         dFC2SzrLFwG46XL9CZofvaEfDr6IH5LP7PHJAXgSHZwJavEuAHCqIoLSa5d9iNTP7MS4
         8Z5dGatyspVgfVisACgtjJWfu0IC/swfwslGzc+hwGCO+pxWie4N0UTN4uqPFH3jMwaN
         GVahqEAfQQYa2xcIPq7nDmHcJHDZ8GSEyOp+vFUmpg4LDF7o1c4e75HeGBrgKDj0zdBU
         +/A3vZfOeaxBkTuk+maMnjumxh1oyJC6DJ8BkFn7h7m/y/cLW+nJzrxUCgz8aM27szyn
         fqjQ==
X-Forwarded-Encrypted: i=1; AL+hErExM01DE2q7X9VLKy29CzEXALSBR18t5A/aeGggDhhBLqN0wxCVr8XwpSH0St0lxGar1BEI9xgbGpKxDx1Pcw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+77d5vdRNm5qI9P72HOYR/it1EqTmGxDFpreb5YVjlBSTAin+L
	Jzuqkw7x4jGHPiApcblMzugwXZnp26j7rHLQLK2PwBSewK5T3tbgVZu4MjaDH16HuzI=
X-Gm-Gg: AZFdTZdqwd2wD6ce/t4GRrcrYOb2Zp7swGQw3ilYBHEQcHKa1+HVe/zPLjumi3KAj7L
	mP6ya41+7G+IY+JpTZs/r6q1ZD7biUdGvFsUq6zO+piqVGCbQC615XakLim7tdvK12QLTMoQu9m
	kcAWTMQklJMe/z9eYbs/4G+5C9gzPKKLpBuBo1y7iSLjeSSM8R3r2f3SbZCNzH0/HpBf1tj7pMn
	xdIPryumnK/3ZEL58oRYfCMV4IqnqR0U77kaOyURRqNriNfkpMRxgZfha2nQrRQbGiWB+QFYrZu
	sWH046ytbzl4DLn6XeYBjqN7KUHEzuBx/NYJn2iNB/8T73qlulQqYLw2AN4utuw9pOBTkQ9ignt
	7ezmdEziQfXNn5DyMjyJeQYA9SbcEglDr1iru+jFSr0CVO9r1qMJhiFcAIepIIfKHgZvfM7aT7K
	TN4EGvSsYdc9RtSTgcitLM/J8A2EPSt87XMgGlsDexkLoG2DMm4/58gyLo3LS6mcW9pPyRDupMg
	yMXODvYb0i4WzZIFqGS91T0ORG+S/HindMkNHU/o2pbOZJdynPq/2r5t3v1COQmVke/V1Ljk/Dy
	xzDgWTBQKD4fM33ngsHIIpBVnfuzawm6oHVV9pWJ8ejN3vPYhFNPSzGxufIvYHf1LRAwMSD8iu5
	kxqiga7+Pb0RV+UABbgs5vYF54w==
X-Received: by 2002:a17:90a:d2cf:b0:3b0:9781:ee8b with SMTP id 98e67ed59e1d1-3b41c9e46b9mr11862740a91.26.1795477049685;
        Mon, 23 Nov 2026 15:37:29 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm22676475a91.14.2026.11.23.15.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:37:28 -0800 (PST)
Date: Tue, 24 Nov 2026 10:37:25 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: guohongyu <guohongyu@cmss.chinamobile.com>
Cc: dan.callaghan@morsemicro.com, arien.judge@morsemicro.com, 
	johannes@sipsolutions.net, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	13057616121@163.com
Subject: Re: [PATCH v2 1/2] wifi: mm81x: clamp command-response copy to the
 received skb length
Message-ID: <bpjumdldx5sj6ejkypglwajk7th245ppczedzmzj4rxjt2ug44@bgbijfc5smby>
References: <20261117032227.154874-1-guohongyu@cmss.chinamobile.com>
 <20261120064905.192045-1-guohongyu@cmss.chinamobile.com>
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
In-Reply-To: <20261120064905.192045-1-guohongyu@cmss.chinamobile.com>

On Fri, Nov 20, 2026 at 02:49:04PM +0800, guohongyu wrote:
> mm81x_cmd_resp_process() copies a synchronous command response from
> the received skb into the caller-provided buffer:
> 
> 	length = min_t(int, length,
> 		       le16_to_cpu(src_resp->hdr.len) +
> 			       sizeof(struct host_cmd_header));
> 	memcpy(dest_resp, src_resp, length);
> 
> src_resp->hdr.len is the inner host_cmd_header length of the firmware
> response.  The skb, however, was sized by the *outer* mm81x_skb_hdr.len
> (mm81x_yaps_read_pkt(), yaps.c:186-199: skb_len = sizeof(*hdr) +
> hdr->offset + le16_to_cpu(hdr->len); skb_trim(skb, skb_len)), and
> nothing ties the inner header length to the outer one.  A buggy or
> malicious firmware can therefore declare an inner hdr.len far larger
> than the payload actually present, and the memcpy reads past the end of
> the skb's data into adjacent heap memory, leaking it into the command
> response buffer.
> 
> Clamp the copy to skb->len so we never read past the data actually
> received.
> 
> Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
> Signed-off-by: guohongyu <guohongyu@cmss.chinamobile.com>

This has already been fixed by cd4335a9a41f ("validate response length
in mm81x_cmd_resp_process()"). Make sure you base your work on the
mm81x-next tree [1] (or -current).

[1] https://github.com/MorseMicro/linux-wireless

pw-bot: rejected
