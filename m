Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684950;
	b=JW8bjdhFGyAspPhZ+bs3e4Hlo+t6DGGuRVEMZCtT42PEUea4WTQ8mHCLjDUw15E0KCO6
	 R3YG4yfQ23Z5uG/ZYcAGYpoLyGNdoyVoFA5qtQomLoQ5C9NkHQGSfXLlCqTYe6ITiBSd1
	 qIQ0j24PkcVraXTAmq6px7aQ3CfWK1N8o5vWEH+e8Fn8bx7pH7RBUm/If4ZdTboLUxJhK
	 jo3D9bsVhiWAphAFn1eX44jkoKg0dmwo+r9VTbl5eZNvj8XmpD+aZpX4qBvtLTodRSr6Z
	 PhhAJJIs9Bp4TNxtCMB5FMOA9vVfo+PI/dLn4pbPEFhOnQo+K5qjhlEdHQKw5tsC5xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=rWiiF+apEITg7T+z4C5J/H9oWTwRfn9iGA6HI9XcEQQ=;
	b=rfj8JJ3usptBGhYPsqBL3xAFnKTnQiiXZ6oCwtz59M2tN2eQZqyrQXBl7d8+pnTWMEw1
	 MLyt43iv6YabzTx4P2WH4U5LwniMmGVtAh7lyTlkc9xpb2TngmNUMp9n2HawnoNzuS/Wx
	 z8nFbJ4korTMj7Q0CWoQh0iNMk//Tggqk0ey6t0R4hh5WfXf8ldfDgGUfDfHzVzzPJZOc
	 JthZmL0h4dHD4Zp7EI66X7RTnTiPKeOe7fjHGC+M09+8cb15PS+KBslef4aK9xuO6FWT7
	 DzpDvkyGeyfELbmzYS/JVn8hDnUhBQndlB/j+yFEkA60BJ9M8UBQMrycZIfGoLmdEWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlRBZkaG;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A31E606A32E
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 19:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A31E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlRBZkaG
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b31448caccso17026757b3.1
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 11:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684949; x=1795289749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWiiF+apEITg7T+z4C5J/H9oWTwRfn9iGA6HI9XcEQQ=;
        b=QlRBZkaGP5E5t8mUNxHx8PPoY7TwjF30IN8avUcJ1T+sb2VocojIB8xVigEbclYBIZ
         G8oUoPmXOzIUiIxMpXl3670uXb/fKkKvfXte8oFdOd4NHJHksjTaNKXin41BaEZxmOrL
         gTy2rOz0SZOsdpIqYE5mH+nHRd73QcMGcIfdPIuWZGHlQSJPCBH/ci8IXDsQl9QIPKI2
         xMvPAkXs4EHcWybv4vs5UF3urviB8I8Sxr+3IFFzF/2iBPRfC9yN4BPHXqyCMRXd2wgi
         E2z9vb1K9rddd93yGogq/11kqc1WbRqJ1TDAAWBsdup7GmYFMWVBOw5KDz0PZ0FuR2Ff
         JH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684949; x=1795289749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWiiF+apEITg7T+z4C5J/H9oWTwRfn9iGA6HI9XcEQQ=;
        b=p9tnboTUtUCkPHtazXFknYqOSR+HsM05gCjYr/AxINUknsL6Q1wEQ/M5T5Xuv29RWo
         uNvdvWSTS2EMqBH9Pw3kq1XEHT4yfsQKabqDRKt1Iwb96Pg2MvRjogYpyAp3I5xlbh1P
         bjFG+sYEIEhLf8soD+POS5K6Y3DnjrNJdhuZfjwudhcLGI56GZNBvCTo2x3gCYgE7Llp
         GFQhSAZBbx69MxRO2i1q154XfvGiQCKYHlRS45nRPmOY+6KH+ZsVynIEZo2P9/rS8Eln
         Y/DcfpmFcBAsHDKY52b1IK4DGgx53g9E9ZynGb2fhaZ+9oWhO0iIw7BkLJ7ssnRZjChb
         /uCA==
X-Gm-Message-State: APuU4Z9NqX/VLEhyceULjn0uW3xmZPO2APCIzGEOIXgvBzFME44lxAQw
	ZSz0jPvfFvGcPiTDYRbh+aN3yqqW1hpphb5eK07HrE0pu48IM+GoDQvI
X-Gm-Gg: AYBFou3JKhuvPkmSCwLlEqh6RByuvrgmzF4bsR4Gjex1sSNWujMb1e+gaVeH88LbXcI
	znX7fH9rhXG7C/aZgAzC9Sm/yX51KiAAnLDRUezIFimi9Zt0GfrknCnIBaQNXgjeUEtYEbYEtzL
	+thyBS6iwlCM0M+xfa5e3naAWxQdG+S88UyOTp+6IzfWlnml4lv41Wr6btdbjgfvDnewwk68NO+
	gu871ldOKc5+viYbLUQkskGCP0vuo7pDI0zLBKAeZbTlIeCBHW5ezdRZOyd2o+jzbN35KI0cDW1
	647mydYgyvyG4vHP22Sxy/dmtoSCaU1hLSFKud9K7W2d9B5inhoyX2Skd63Wd9k76xbdnPRQeHt
	ygq08hJrmibwYBX1FZ5ykgrrAVh2JbXHRY0W+iSvQWasW3anSFg86gBFh/gFIY3rNVH0r5CByTi
	oIFOtKxhecuVOAo7EbVckySwRMIBq0j441YDmbb6OZ25FW9GudO7EOEUU046w9tbcDt8UAtpbPo
	D4wS5IQO5+dvutbDro2zysUwha/z7JtMAOgRBq3F3YXK3U+skuiBRsQXp7C4HybKKUF576CYZgQ
	zI98u4YemcWDK7i+bjR6b+moJTnCDTMJT7Nx3EI5kjJ93p0gahxvvyFnnRLJyMi9XwUpiZtdzf7
	oU2EhyrQP+uI=
X-Received: by 2002:a05:690c:c501:b0:8b4:c1ef:7a62 with SMTP id 00721157ae682-8b4c1ef9ba3mr11528507b3.49.1794684949396;
        Sat, 14 Nov 2026 11:35:49 -0800 (PST)
Received: from [192.168.50.163] (99-7-255-95.lightspeed.clmboh.sbcglobal.net. [99.7.255.95])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7ee70csm50209077b3.6.2026.11.14.11.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 11:35:48 -0800 (PST)
Message-ID: <4a56db1c-f6ba-4468-92e2-0d5553222c4f@gmail.com>
Date: Sat, 14 Nov 2026 13:35:47 -0600
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <f154f553-6739-48c6-bddf-21f429b34bae@oss.qualcomm.com>
 <a715e044-848f-4adf-b497-de745169e6d2@oss.qualcomm.com>
Content-Language: en-US
From: Walt Holman <waltholman09@gmail.com>
In-Reply-To: <a715e044-848f-4adf-b497-de745169e6d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 09:26, Jeff Johnson wrote:
> On 11/2/2026 9:20 PM, Baochen Qiang wrote:
>>
>> Hmm, forget to reset revision number ...
>>
>> Jeff, let me know if I need to resend it with number fixed.
> 
> No, this is fine. Waiting for a R-B from the infrastructure team.
> 
> /jeff

Has there been any progress on this getting merged? I need the patches to connect to my wifi on anything other than the 2.4Ghz band with 7.4-rc2.
