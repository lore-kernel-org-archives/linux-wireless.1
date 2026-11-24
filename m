Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480478;
	b=egi8YMhClTQ54LzhsFaaFu/OZpDEmspkc4cgmXGbQl9GsSEUVBeI928ZXZsAtwkS57L0
	 zjFRSw2vwNJ8UC/UlemJYYAuCsps4Fo03ojxGuCwWwW3G+aoLbt3wKqQjQMU9sMtGF+wM
	 ATE/7ckGq+zaCsr/ywNWrAxZnDsmo9XH8erGrBZtMBXoBfBUkjMRIakzTiol/nlApsBwE
	 oMmiwQW/HZBuGe83T4KsgBVjzbv3qN3TPr4k2/XpCi2Dt+zjF5FtNlYjtGz9FonvFozX3
	 LuyA1PRJcGv1YbyEjTjNgUNIfTrhJujBVg4ey1KWoi4qOdM+9BwySch+NSbkwZUVXKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=l7RsmPiXmsKn+Pr+oiok7oJbW9rtNR1UkxIP+KjD2WM=;
	b=Oqz1i+sCZHMCNuSXc2VCxTRWYUgJm+80VAg8DCM9b4S+o8Q9fnoPXgD1ShX1OllvkCw1
	 0PHFLhY3vudSjckWXpZmk15Clo1vxFslSeYLJ7eFfYB136QQ3iI44k1VLe2ZckDaaMZyW
	 viGGVdJKCCvkJD4SI24fl6nZnNye+vnbzCpsLTKhewM2S6mHW2tnqDTtGPwWmFVjzHZeS
	 UZetm0gxEA0nqJNQVpUqTovPYQoXrB8j6575MufWWN348OEoWNVlJjDh7nFxFaN8oBexV
	 RE6/UlZLlewCUFgKhIYghFokRHe5z94hfOzL34cCqcXyDo1HG8mK81ZlAWpjZmoXIvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Fl95uPc2;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91144606A322
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91144606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Fl95uPc2
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1486270a12.2
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 16:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795480477; x=1796085277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l7RsmPiXmsKn+Pr+oiok7oJbW9rtNR1UkxIP+KjD2WM=;
        b=Fl95uPc2lWIRLyNUr23VSjU/b4abaP1c5nkdSmtoCKLrh85iqjzNtkD9lEH0v9g+5D
         fhSoOyjdI426VOA181RhnHHat6RimdbYi3kT0Kt/aVO/K8CwlSw8wFY5V4vxRaoJLP2F
         1TVJHq3XMkLsfB7buzrGpDxAbck2qM/2Km/Qrr8J+hehuWDi0t7s4Eusl3hd7NjhVmO5
         5E0Z3RGf04wVwv7Wxt7S/ne+0xb1RSadAB7djYE7OuqIisEqWIvY7vKqMBG0FgEkn6qh
         L4qyAMxwiZNvZkk3q99S0TMP+F1irub7VBBJY2isyF59cFxAyusXqIORZKzoBwucaQF1
         QBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480477; x=1796085277;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7RsmPiXmsKn+Pr+oiok7oJbW9rtNR1UkxIP+KjD2WM=;
        b=FHEUeKb7KZWXothZibQSKuMhHghmLk42mdVuoRohoMGrFcq+DTg8GVP5ZqUU0mBfvg
         7xhVB/1SYkxw8iaWubfwPIlW3qoh0qYfFxExCuARVJwaxG2NrYcNVt+XeH/UV85r6pny
         ZLY4nRytJ0JqOfvsW6v//p+Sb8rYBdYjJuIjwC/splQ3EHWDT+VPm9Q+nSGEj2hyjjzC
         Z720tYZwyNzuSieb9ZRd0PdV1LpzBUq/Vt00l9JbXvuh5Ta7XfQ2k2IuB+iZj/oHrGQa
         icG1gCpVUwtg1YhPHvFWJpNeaVC95LRJ1iIdtE60/fETI2LAomoo+g2YnLjxiEdjJ4NF
         Y25Q==
X-Forwarded-Encrypted: i=1; AL+hErHf+FhoS0g+i1dyEMFO9hIyCcHcXXhNwpm8vZiu+3klgvy5Yp8I2UsBpTNu5dW/kLwX+tQBwO8suR22wWg+CA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VqeNyMtZoNiGfsTL0YlG51uy5HrS9nkJJ5u+pJ+g4Uu5NEYvV
	0YpOW/9yrr6p5VEXNXa4MRnZKA2Ix7GrIMXlvi5Ap188n+hw6VMJCr/CpZF4vdFCIVE=
X-Gm-Gg: AZFdTZehr5YWqKChn6uz/DXsegt2lKy3jXrkxVnISIi1RLnfHB47dRHti8CDnK29lsr
	UY9M0xm/m27OiFUrqkZq+q9u+GwHcSihc7pWjrT6RfnpNt5aVB+qoEJb+/s0MFQKO6Y2NQEkMYY
	1GPa1t/O8oTXkRbSXn7ZFh+XseMhuP0Qm6ZbdeOhRndh29ZZ7w7uvr3cWVsC1vhguci+0RsPfRI
	CAu1RKVsRzrx8RYtMbZxL78YXZgEkYWGolH6pCr2upRGaJPH9wn+EnBAO8tpNUJHgTYsgWADc5u
	ipmlVEQdG3RiYORXq39Wi/QSgFS0YbSzdBRQVl0qRGL/m6xR92qfKodQDB5CSfdej/1H6NbNccI
	+15bmFCGYwUZA2qaS64UbijGhlcjlBhzjB6wTV/mfFoStHyrlsvoPUUqXPxgRJJtlCsqFW79Fxa
	mr6blUzZxHSUeeoVaAuJr50l903h+SzFn26Qn+K/H49TyD0/XIUEYFz+I9tZnfYaqG6zcbNX1t7
	harva4PQ1efHE8gTr/ZB/0yalggtmAjKXwUm/5gkND2dLrnu1yU8Iyzg6v0c1v8cIojAKKvQhDF
	SudWYFjyIvoQ3XVjvXV2kt30/uvEu3R5OIG31F7oOVrHModnG5gCE9k3HuBgAMqz0vFKrNBX23G
	HLuxb4Q+n2EqXfFdKDHQSUkim+A==
X-Received: by 2002:a17:90b:4e83:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3b41c956a0cmr11971327a91.53.1795480476894;
        Mon, 23 Nov 2026 16:34:36 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b704cfesm7131414a91.1.2026.11.23.16.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:34:36 -0800 (PST)
Date: Tue, 24 Nov 2026 11:34:33 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Dan Callaghan <dan.callaghan@morsemicro.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Arien Judge <arien.judge@morsemicro.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Bin Yu <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH 2/2] wifi: mm81x: clear a stalled bulk endpoint before
 the next transfer
Message-ID: <vshptwv5idooqjvdirp5ssf2ofiff6tjhgjnzqgptte556uzem@f7kec5a632s7>
References: <20261121164923.8862-1-25031212351@stu.xidian.edu.cn>
 <20261121164923.8862-3-25031212351@stu.xidian.edu.cn>
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
In-Reply-To: <20261121164923.8862-3-25031212351@stu.xidian.edu.cn>

On Sun, Nov 22, 2026 at 12:49:23AM +0800, YuanZhe Liu wrote:
> A bulk endpoint stays halted after it has answered a transfer with a
> stall, and only a CLEAR_FEATURE(ENDPOINT_HALT) request resumes it. The
> driver never sends one: the completion callbacks only record -EPIPE in
> musb->errors, so every later register or memory access on that endpoint
> stalls immediately and the device remains unusable until it is
> re-enumerated.
> 
> Clear the halt of the endpoint that reported -EPIPE before returning the
> error, so that a following restart can reach the device again. The command
> endpoint is the memory write endpoint, hence the same recovery is applied
> when the command urb itself stalls.
> 
> usb_clear_halt() sends a control request and may sleep, so it is called
> from the process-context paths that wait for the transfer and never from a
> completion callback.

I applied patch #1, but this one seems .. interesting. Have you run
into this problem? Do you have a reproducer?

lachlan
