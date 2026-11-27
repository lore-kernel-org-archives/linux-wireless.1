Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776624;
	b=TamYca24sxjQavsFKba0miFQ5A7ZpMVsqOmYyJ02V2rKoCXzq9BHqOYrDfidBDhAtAtA
	 KLyKN9MLWuNQZN7+o+jlSxPTINrT3VGnGgLC6d2EFC31akKLlzbUe0VJ9SLScvDK2niK/
	 M4JPtKzLkIfny4z+RcUhbDVcKtOlhLtpFSKd9//YixIzN1bEiTzNmU18iJtg0pwli+0hW
	 OirD3Id9Voj2eqEy3AZFMLKLTkmzMoZhANT/rqvmqu/QUMbnn77h6pzG10/vDlLzhLOTX
	 g0zV7Ofwh43Fz5REYdlOaZuoy0HpNw9bqKb/zhAZu9THzhW3q7L38eAc19JubMa1TOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=oxqx4+2mrqQgklZ+aQV9HlAypYEAvxzDqsQRNWeqaXM=;
	b=VEhXnW6rNOCFiFRl13UolyOAKCIhnO6kvcE3KLKIk5E24VDI0pQL4shdLeVKZh3No6KD
	 ytDwctIhP/tMEc2M72QF/2grUFyLPMEXVZ32rgwwV9hFQqtdiG1Qq5IJpLhMiEIUumrTl
	 fbiuP7/dZULTER7F65rMoeWi59xnp3UxxU2lDApOmT2rOu9Nd9QqtEQ2fdHlbjrQ5A2GZ
	 9I06SdB1UYn+6uNbEorIdl5FFClN9LoLV7m3etxT0nfsaQ+TUTtYAcI4I7AbbcZvfamDf
	 rHRwyvUtB6cv36oKQSPzpNrgd57e1XdrdQOeRoAm1GcuXXoGdtmdT65Z4dAQzVWgwAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1yAO6Eq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07613606A327
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 10:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07613606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1yAO6Eq
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so10291338a12.2
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 02:50:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795776622; cv=none;
        d=google.com; s=arc-20260327;
        b=YfHXMymjGgHjrurgr4noAteO/3j+QaWKdi8V9b0dhnAqXegdArD6zir+yjBg9SonCP
         Eo6lzAe7/QTgmysilgjYSuZxgHYuimrGfvo8LtDcC7CuKdZv4c4uIpN8sS9eP1g7ZDI/
         aEi93zHHgteDO09qhqbxBqv3u2r2Rhl1qqOaaun0DLM0zJLMlatllcLNykT0WfleaUBH
         PAzuaNvmC84YrbCsDUZ8fjD+Yprj1NvVvfrxBzIM9vWZ9LI11VcO1Myv3ar970M0cGx/
         7SGrdTAut7T0x1mOdQOkSuYYF1O2zH6hyDhW/6d3l3/54h14Mdkxi9K1HkFGlfOOZQZr
         oLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=oxqx4+2mrqQgklZ+aQV9HlAypYEAvxzDqsQRNWeqaXM=;
        fh=9WldBRlRtbXZDyFR8AAB0r3m1QxMTnrA0PJPmHd+ThE=;
        b=K/viqn9RYPxCcF/NeZI28Znam+URXU+yLVqxUv42046MgGr+MzCTolGfDEy1DTZimc
         lII4KJkQo99wTM2qhnf1Za7soFwE3+y4Z2p8w69EKitunr93W6zQHbFHpw7rFKErg55s
         Bxr6FZt8Rrt9PburJgn0ziNJl+JNpy7RgE28YUnQrwgQ+0g+CKK3cEhXg56CT2yJxJLw
         MmPQ+PC04oDLjeytiPmBODQBot1GCNwVuYM3Jtt08SasFiw4o0YXUZNV9SuDqxd6843H
         y4RgOIzSd5XRg68Ifo+HkYHF+2DiVSt4z2gJuAf7t2Gkgc+hMc8YISh5b8/zQLE5HDpO
         wbQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776622; x=1796381422; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxqx4+2mrqQgklZ+aQV9HlAypYEAvxzDqsQRNWeqaXM=;
        b=l1yAO6EqsbRn2rDDy4ltQTsnEMdSbemz3GR1oN8cONpATXi7azBUfFSYa6K60V1MLZ
         h6IlYPLA/OvwJGWY6AFI+QwI80SnIg9yDFfMtA7E3cgS8LtMBTZAKzmOUlkX6+PANo21
         HSAEpcPxKoEOfAtsRFvjnzwUcW0WSL2bHbiDmnVZZ8BDlgXwM0xLQ9tPllfWlIxAPC9f
         +Hqd+VlSNOJZb9Emtb5/vd6qHeCQyhexJb0PuUnjj4vdplAddzKZPU2DKOBG3zJ+zcRD
         opwl7wVC3q/B34dppakR0ZgGtVVwTTsz+HIObkWPLpxz4xmN5RamBfSXlCMTuFtDkGnN
         is+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776622; x=1796381422;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oxqx4+2mrqQgklZ+aQV9HlAypYEAvxzDqsQRNWeqaXM=;
        b=J1d1X/itVfBxvyIXU1vLhBVV4+nQWiOTgiFdQKa9LzEd8W1b4SMuUDwjPh2Cp61Kv8
         LLI12RfBIM0vtc0I+0wkBYK7g+mWFKeYfd8P2Q9Yh3eS8mU5AOhfJf2Jbk2TedmUM/Nj
         IoKPiVBYR3mzlG9HXG3yjmkrLyBnPwAhNE+BBm9e7tRf5JdQKdUvWw/7Lj9iBYm6ibvB
         SteKTBEb/a69XXS2oh+mxRh8bdKb70ylRkmHShVx3Ozu7a61KGmrIgZhsz8y4prDihsr
         7g3vt0z/mliwuhJSHhNeJzkBXvNNNmsUP5pWd3zkiTpyS/RE4bBi+cIA+rslwsNhMgSq
         uLDg==
X-Gm-Message-State: APuU4Z+5MpeuITY/4BCwYqDkxqQkQihrOBLT/b9t393+xvhISFGZyV8j
	lHwc3zt2B+s6sZUWSS55Lb/H31b+E+FSwlIODrXuYCkg17eHgaSurrwuGHHeaBoT+2yEYKhcioL
	VAZ0C6PinDXQF0Xa9ITZcf9QqWIV1LcrU0XjZ
X-Gm-Gg: AZFdTZcpL0HvjQlVxwV4dBqZUcE4BI28rqT+eJfEo829yxd/MWF87ALRxYvxcn/3uw7
	cbgzR96YAzLFlDos3cjAI2TlFmsyh9satMvcl/rTAuOWuq07PAqKF567e56CaBeMe9M0qyOZG10
	TfVivksOw9CQLfWzY4oFofB+jTpaVaSrlxizq5ir7B6ayF2SMo7M8LhlL2NieGCdTrBkLSrnKFv
	5yS2YjWE1YtHo8SJZymuxV4xZPEof4mcxsBKQiZ4Sy4rKMRiZ4UttEkiqVstanIIH1behj6FuzH
	Igltd9VlDVtOYM8T7o8zgIqbDulEI4bN+ABLGMYeKOoC+T1b0icGVWVNMkzszEv5iWUwmTK25aB
	1VFwPYMNMhWkh8A9xH7fnBRjOLSsOMi0amwOMt78Jr7r0+VCw7vn891C1LFZ76PzmYSdRFw==
X-Received: by 2002:aa7:d7ca:0:b0:6b8:7d2b:4dcb with SMTP id
 4fb4d7f45d1cf-6ba37d62a44mr13324993a12.14.1795776622248; Fri, 27 Nov 2026
 02:50:22 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: SXM RULEZ <sxm.garbage@gmail.com>
Date: Fri, 27 Nov 2026 11:51:44 +0100
X-Gm-Features: Aa3M54p7t7R0_A2iZHLSk4h9mg3ZgqsOIYL5DUccUCUlsNG4T9aCss4y5XfGn8Y
Message-ID: <CA+qHB0qP9Bm2noNr2Z0M2mCE0YwGOL5tjFFCkjOGT8EsLxF9hw@mail.gmail.com>
Subject: [BUG] rtw89: 8852ce: firmware 0.27.138.1 crashes (SER 0x4000, failed
 to leave lps state), 0.27.129.4 works
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com
Content-Type: text/plain; charset="UTF-8"

Hi,

After updating linux-firmware on Arch Linux, my RTL8852CE started
crashing repeatedly. Downgrading only the firmware fixes it.

Hardware: Realtek RTL8852CE PCIe (rtw89_8852ce, 0000:09:00.0)
Kernel:   7.3.6-arch1-1
Package:  linux-firmware-realtek-20261124-1-any.pkg.tar.zst (bad) /
linux-firmware-realtek-20261019-1-any.pkg.tar.zst (good)

Bad:  rtw8852c_fw-2.bin  Firmware version 0.27.138.1 (3e6fe838)
Good: rtw8852c_fw-2.bin  Firmware version 0.27.129.4 (3f1a5302)

Log with 0.27.138.1:
  rtw89_8852ce 0000:09:00.0: [ERR]fw PC = 0x20150b6a  (repeated)
  rtw89_8852ce 0000:09:00.0: SER catches error: 0x4000
  rtw89_8852ce 0000:09:00.0: firmware failed to ack for leaving ps mode
  rtw89_8852ce 0000:09:00.0: c2h reg timeout
  rtw89_8852ce 0000:09:00.0: rtw89: failed to leave lps state
  ieee80211 phy0: Hardware restart was requested

Reloading the module with 0.27.129.4 makes the errors disappear.

Thanks
