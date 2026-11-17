Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922320;
	b=XXXC9mPXx26fnLXHmwCR/E39QQsDjQ/GxadFiHWqp5rQfWmdYtyqye60iH5Ke5h3TEsw
	 XsmBMCQG6KdJ4KvU2kXs91OwAASuLUvKE6kcxhI4TAL+OA6N/m/HUYyLVUGtaK8Q6p9lm
	 VJmnR/C8hBOUtaX6a2IzD2HwafPysNOQjvc+waip1iXUekiSzd4rx/nelSZ7DHDue9xOB
	 87OnXXEiTtnR2cV9wRpD5MOvi1YoGlwPiCdI4T/sL5akC2bd2htyVW238vimk4ROIfmJE
	 aPV0ayQHJ8kxUxlX1SqhbUTcEbG0NCXN4N5nOBJaVxGnRkBLpU5rJznBcm75nVmwEYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922320;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ZD6TBLmK/IIZSnjK7MAJYBAkHQUcSU3Vb9rupdsZ2as=;
	b=WddEbhavox3vCJlxpuWvzoTKNSZiEZPvA1xMPNbafyyqa51GSnsUyKyEn8CcsP8unAoT
	 dCeCMyewHGUXQ19e2qSY6tKaFBNeq5MNMXuALTc9lLw3FYWeI/UKcLgihT3ETcXZCXmJ3
	 qYRszfryqHrKtfHJbEUZasrsT7xqSHKQ6xtfJo4kCq8foQ6NczYzoscEz5+nkIZhNq2Nh
	 hnLtXRM8zX1rF9gr+T8JdbvaFHIFOQL190mPlCvmy5JSMYOBA7XXZOoa0+bCdPEdc+yio
	 xAS8Qi70ALcbhfOar4mQ5Bqg6M8G9RwaIv0t1OIg6jE29fjDUxgY8duZdzSmS/t1Dww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PlRC5AOQ;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97790606A329
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 13:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97790606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PlRC5AOQ
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2efd993e9d6so5052145ad.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 05:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922319; x=1795527119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZD6TBLmK/IIZSnjK7MAJYBAkHQUcSU3Vb9rupdsZ2as=;
        b=FZrCVsKEy9XYNd7/144tHe2vgPpGMibIyxG7uOakKohwHLbTwWwtK0KplL/RleQhMv
         vO90ZZ4KnE376AZPbPwI6wOPAz/MEhvbDxgbJMuE9TjLIdyVfHBbe0SbiJsXmX7CL6sN
         TYTJXDOVW9oQ6kKAlq7SuUE3OM22cN1qmeK/Xsku99hL3rgjfYa1AXopauzAu+HGwc7M
         tzIpPfuHyS1MY590CUlXP9dS5YGnYQ0O+Fz0P08LvFfu9iEtQmPGXK/0V+BhnTh+ARd3
         mGgV0sHuz7k9eZTrGkhFYmB8arYS5PQB5vVqMpWLUMXLsH+kpu/bTfTZN6iL9zdVXfn8
         Flig==
X-Forwarded-Encrypted: i=1; AL+hErFvefc6iiuszRUKVwR2TjhqHHsiMCFb/8mE+7UBtUtSaBUAR5yCV496+OTDyJvwJE68xmj4cMnmgxWYCdPNPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+NeJwhkkYnUkWqeqmtOl25o8jA5bHG+nMpXfgROpRwn6OYDkbP
	RSYQh7XofBLe8FAnzk6Qs88b3QdTGoo8s09Lgckm0URwfDIIAHYvF7Nf/886PO8EHViEeO5Ob9V
	JuEMJRrTiWBvvJYFWMVtzpztKCXnM1SV4VeSXygbvy1PfuFSK5owWIj3Al7eefyt10Zz5m/IYXJ
	G8usjtQw/qO/NddqoLRXxAVFbbekvqDiCxHRYokxWHBOQ9ong0AR5hB3+0Bi4I00rX8vmFrHrMB
	+u8teikyX4JsxXBCdzFSNMCVh2j
X-Gm-Gg: AZFdTZcpjy+VwIMq8yaj7eq32oEmV+FoXvhdnxJF+e7f57OhiOIA7ViAwhTGZpC64j8
	v7irweCfRtky83DBQ49/ylo3xhYR1G/xHNz+Wh8AeuYR6buWXRTMmLxHSAba3vnm31zokCyv1No
	sYHou89R7xWl8r8okZNQM9E0+pdDB00bPeY2y4WoMupSO1gdVcijM96A2IlB80DQDGz5pdD1IYJ
	kKHte1jgvXjJHr5CPF7axmMXoeRUPdm8o0sMCs45FKUtWeQeWpbDGzYO/JT80U/hSZjqXJrUyrR
	mzCBnhki8H5762tJyRGCVm+U+Loh1I0eoveldZA/sUTbhIOwwWk3tH/GDKMWZMPbKwpm7ipntWu
	mpCCH0p/so56MQJezqeuIvJs1Dxy0KThz8aJ4JPd0GLDipQ6b5fjOYMAFOzUWZWAx5gUikTNL6r
	J7d/fgPn45dB2+GocyXS1G76bsXOIj0qf9v0xviBg=
X-Received: by 2002:a17:902:cf43:b0:2ed:1fba:e5eb with SMTP id d9443c01a7336-2efd9a94173mr19515035ad.27.1794922318830;
        Tue, 17 Nov 2026 05:31:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2efd7ab0b48sm661805ad.24.2026.11.17.05.31.58
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:31:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94975041698so216007385a.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 05:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794922317; x=1795527117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZD6TBLmK/IIZSnjK7MAJYBAkHQUcSU3Vb9rupdsZ2as=;
        b=PlRC5AOQNvEEaNBPtfiIa4RVRyTwv7qbsHSPRupzU3gKwwSE7zLAeWYy/asMaw/bEL
         LL7kpo+CJw1xgBJE2GOrK639lT56hdsBFX4ENLjGNz0qumDJOA4N4uhbK8ihzZHeMo5g
         LbALfNvQEBLTNy3yGDDjcthShA/LT2npqM6wo=
X-Forwarded-Encrypted: i=1; AL+hErFz6A1LHmEgPjBWDbxPpcoCKANaxfFQjWCdqPGBga6eZJyLEwCbalwAJI4kSBVRytC0YQY+8Vewr+iUGb+rrQ==@vger.kernel.org
X-Received: by 2002:a05:620a:17ab:b0:93e:c853:fc07 with SMTP id af79cd13be357-9498b826e55mr385557085a.32.1794922317152;
        Tue, 17 Nov 2026 05:31:57 -0800 (PST)
X-Received: by 2002:a05:620a:17ab:b0:93e:c853:fc07 with SMTP id af79cd13be357-9498b826e55mr385552685a.32.1794922316505;
        Tue, 17 Nov 2026 05:31:56 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8fd141sm1094292085a.43.2026.11.17.05.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:31:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	morbo@google.com,
	kees@kernel.org,
	justinstitt@google.com,
	codemender-patching+linux@google.com
Subject: Re: [PATCH] wifi: brcmfmac: Replace strlcat() with snprintf() in brcmf_fw_alloc_request()
Date: Tue, 17 Nov 2026 14:31:50 +0100
Message-ID: <20261117133150.817227-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
References: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 13 Oct 2026 17:55:52 -0700, Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:
> From: Bill Wendling <morbo@google.com>
>
> brcmf_fw_alloc_request() constructs firmware file paths by chaining
> strscpy() and multiple strlcat() calls for the module parameter path,
> separator, base name, and extension.
>
> In preparation for removing the deprecated strlcat() API[1], format the
> complete firmware path in a single snprintf() call.
>
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM

Is this Cc: line necessary? Can you clarify its purpose? No need to clarify
in the commit message. Just an email response will do.

The Assisted-by: tag shows this change was produced with an LLM. Please
follow the guidelines in Documentation/process/generated-content.rst so
it is clear what was tool generated and what tool and/or LLM was used.

[...]

>  	for (j = 0; j < n_fwnames; j++) {
> -		fwreq->items[j].path = fwnames[j].path;
> -		fwnames[j].path[0] = '\0';
>  		/* check if firmware path is provided by module parameter */
>  		if (brcmf_mp_global.firmware_path[0] != '\0') {
> -			strscpy(fwnames[j].path, mp_path,
> -				BRCMF_FW_NAME_LEN);
> -
> -			if (end != '/') {
> -				strlcat(fwnames[j].path, "/",
> -					BRCMF_FW_NAME_LEN);
> -			}
> +			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s%s%s",
> +				 mp_path, (end == '/') ? "" : "/",
> +				 mapping_table[i].fw_base,
> +				 fwnames[j].extension);
> +		} else {
> +			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s",
> +				 mapping_table[i].fw_base,
> +				 fwnames[j].extension);
>  		}
> -		strlcat(fwnames[j].path, mapping_table[i].fw_base,
> -			BRCMF_FW_NAME_LEN);
> -		strlcat(fwnames[j].path, fwnames[j].extension,
> -			BRCMF_FW_NAME_LEN);
>  		fwreq->items[j].path = fwnames[j].path;
>  	}

Please address Kees' comment and collapse this into a single snprintf().
Note mp_path points to the firmware_path array so it can never be NULL; an
empty mp_path simply prints nothing, so something like the following would do:

	snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s%s%s", mp_path,
		 (mp_path_len && end != '/') ? "/" : "",
		 mapping_table[i].fw_base, fwnames[j].extension);

Regards,
Arend
